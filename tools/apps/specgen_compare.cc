// Copyright 2013-2015 Stanford University
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <chrono>
#include <fstream>
#include <iostream>
#include <random>
#include <map>
#include <string>
#include <vector>
#include <cassert>

#include "src/ext/cpputil/include/command_line/command_line.h"
#include "src/ext/cpputil/include/signal/debug_handler.h"
#include "src/ext/cpputil/include/io/filterstream.h"
#include "src/ext/cpputil/include/io/column.h"
#include "src/ext/cpputil/include/io/console.h"

#include "src/ext/x64asm/src/reg_set.h"

#include "src/symstate/simplify.h"

#include "src/validator/straight_line.h"
#include "src/validator/handlers/combo_handler.h"

#include "tools/gadgets/functions.h"
#include "tools/gadgets/solver.h"
#include "tools/gadgets/validator.h"

#include "tools/apps/base.h"
#include "src/specgen/specgen.h"
#include "tools/apps/support.h"

#define BOOST_NO_CXX11_SCOPED_ENUMS
#include <boost/filesystem.hpp>

using namespace cpputil;
using namespace std;
using namespace stoke;
using namespace x64asm;
using namespace std::chrono;
using namespace boost;


Heading& functions_heading =
  cpputil::Heading::create("Auxiliary Function Options:");

auto& circuits_arg =
  ValueArg<string>::create("circuit_dir")
  .usage("<path/to/dir>")
  .description("Directory containing the strata circuits")
  .required();

auto& opcode_arg =
  ValueArg<string>::create("opcode")
  .usage("<opcode>")
  .description("The opcode to check.")
  .required();

int main(int argc, char** argv) {

  // not actually required here
  target_arg.required(false);

  CommandLineConfig::strict_with_convenience(argc, argv);

  SolverGadget solver;

  auto col_reset = "\033[0m";
  auto col_red = "\033[31m";
  auto col_green = "\033[32m";

  auto strata_path = circuits_arg.value();

  auto errors = 0;
  auto n = 0;
  auto strata_handler = StrataHandler(strata_path);
  auto stoke_handler = ComboHandler();

  Opcode opcode;
  if (!(stringstream(opcode_arg.value()) >> opcode)) {
    Console::error(1) << "Failed to parse opcode '" << opcode_arg.value() << "'." << endl;
  }
  auto instr = get_instruction(opcode);

  // build circuits for strata and stoke
  SymState strata_state("", true);
  SymState stoke_state("", true);
  strata_handler.build_circuit(instr, strata_state);
  stoke_handler.build_circuit(instr, stoke_state);

  // check equivalence of two circuits for a given register
  auto is_eq = [&solver](auto& reg, auto a, auto b, stringstream& explanation) {
    SymBool eq = a == b;
    SymPrettyVisitor pretty(explanation);
    bool res = solver.is_sat({ !eq });
    if (solver.has_error()) {
      explanation << "  solver encountered error: " << solver.get_error() << endl;
      return false;
    }
    if (!res) {
      return true;
    } else {
      explanation << "  not equivalent for '" << (*reg) << "':" << endl;
      explanation << "    strata: ";
      pretty(SymSimplify::simplify(a));
      explanation << endl;
      explanation << "    stoke:  ";
      pretty(SymSimplify::simplify(b));
      explanation << endl;
      return false;
    }
  };

  auto rs = instr.must_write_set();
  auto eq = true;
  stringstream ss;
  for (auto gp_it = rs.gp_begin(); gp_it != rs.gp_end(); ++gp_it) {
    eq = eq && is_eq(gp_it, strata_state.lookup(*gp_it), stoke_state.lookup(*gp_it), ss);
  }
  for (auto sse_it = rs.sse_begin(); sse_it != rs.sse_end(); ++sse_it) {
    eq = eq && is_eq(sse_it, strata_state.lookup(*sse_it), stoke_state.lookup(*sse_it), ss);
  }
  for (auto flag_it = rs.flags_begin(); flag_it != rs.flags_end(); ++flag_it) {
    eq = eq && is_eq(flag_it, strata_state[*flag_it], stoke_state[*flag_it], ss);
  }
  if (!eq) {
    cout << "Circuit for '" << instr << "' (opcode " << opcode << ")" << endl;
    cout << ss.str();
    cout << endl << endl;
    exit(1);
  }

  cout << "Equivalent." << endl;
}
