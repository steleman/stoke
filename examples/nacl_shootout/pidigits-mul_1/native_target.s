  .text
  .globl __gmpn_mul_1
  .type __gmpn_mul_1, @function

#! file-offset 0xf366
#! rip-offset  0x40f366
#! capacity    282 bytes

# Text                           #  Line  RIP       Bytes  Opcode    
.__gmpn_mul_1:                   #        0x40f366  0      OPC=0     
  pushq %rbx                     #  1     0x40f366  1      OPC=1861  
  xorq %r10, %r10                #  2     0x40f367  3      OPC=3763  
  movq (%rsi), %rax              #  3     0x40f36a  3      OPC=1161  
  movq %rdx, %rbx                #  4     0x40f36d  3      OPC=1162  
  mulq %rcx                      #  5     0x40f370  3      OPC=1318  
  movq %rbx, %r11                #  6     0x40f373  3      OPC=1162  
  addq %r10, %rax                #  7     0x40f376  3      OPC=72    
  adcq $0x0, %rdx                #  8     0x40f379  4      OPC=27    
  andl $0x3, %ebx                #  9     0x40f37d  3      OPC=132   
  je .L_40f3b4                   #  10    0x40f380  6      OPC=893   
  nop                            #  11    0x40f386  1      OPC=1343  
  nop                            #  12    0x40f387  1      OPC=1343  
  cmpl $0x2, %ebx                #  13    0x40f388  3      OPC=470   
  je .L_40f3e0                   #  14    0x40f38b  6      OPC=893   
  nop                            #  15    0x40f391  1      OPC=1343  
  nop                            #  16    0x40f392  1      OPC=1343  
  jg .L_40f3cb                   #  17    0x40f393  6      OPC=901   
  nop                            #  18    0x40f399  1      OPC=1343  
  nop                            #  19    0x40f39a  1      OPC=1343  
  decq %r11                      #  20    0x40f39b  3      OPC=603   
  jne .L_40f396                  #  21    0x40f39e  6      OPC=963   
  nop                            #  22    0x40f3a4  1      OPC=1343  
  nop                            #  23    0x40f3a5  1      OPC=1343  
  movq %rax, (%rdi)              #  24    0x40f3a6  3      OPC=1138  
  jmpq .L_40f474                 #  25    0x40f3a9  5      OPC=930   
.L_40f396:                       #        0x40f3ae  0      OPC=0     
  leaq 0x8(%rsi,%r11,8), %rsi    #  26    0x40f3ae  5      OPC=1069  
  leaq -0x8(%rdi,%r11,8), %rdi   #  27    0x40f3b3  5      OPC=1069  
  negq %r11                      #  28    0x40f3b8  3      OPC=1340  
  xorq %r10, %r10                #  29    0x40f3bb  3      OPC=3763  
  xorl %ebx, %ebx                #  30    0x40f3be  2      OPC=3758  
  movq %rax, %r9                 #  31    0x40f3c0  3      OPC=1162  
  movq (%rsi,%r11,8), %rax       #  32    0x40f3c3  4      OPC=1161  
  movq %rdx, %r8                 #  33    0x40f3c7  3      OPC=1162  
  jmpq .L_40f414                 #  34    0x40f3ca  5      OPC=930   
  nop                            #  35    0x40f3cf  1      OPC=1343  
  nop                            #  36    0x40f3d0  1      OPC=1343  
.L_40f3b4:                       #        0x40f3d1  0      OPC=0     
  leaq (%rsi,%r11,8), %rsi       #  37    0x40f3d1  4      OPC=1069  
  leaq -0x10(%rdi,%r11,8), %rdi  #  38    0x40f3d5  5      OPC=1069  
  negq %r11                      #  39    0x40f3da  3      OPC=1340  
  xorq %r10, %r10                #  40    0x40f3dd  3      OPC=3763  
  movq %rax, %r8                 #  41    0x40f3e0  3      OPC=1162  
  movq %rdx, %rbx                #  42    0x40f3e3  3      OPC=1162  
  jmpq .L_40f422                 #  43    0x40f3e6  5      OPC=930   
  nop                            #  44    0x40f3eb  1      OPC=1343  
  nop                            #  45    0x40f3ec  1      OPC=1343  
.L_40f3cb:                       #        0x40f3ed  0      OPC=0     
  leaq -0x8(%rsi,%r11,8), %rsi   #  46    0x40f3ed  5      OPC=1069  
  leaq -0x18(%rdi,%r11,8), %rdi  #  47    0x40f3f2  5      OPC=1069  
  negq %r11                      #  48    0x40f3f7  3      OPC=1340  
  movq %rax, %rbx                #  49    0x40f3fa  3      OPC=1162  
  movq %rdx, %r10                #  50    0x40f3fd  3      OPC=1162  
  jmpq .L_40f435                 #  51    0x40f400  5      OPC=930   
  nop                            #  52    0x40f405  1      OPC=1343  
  nop                            #  53    0x40f406  1      OPC=1343  
.L_40f3e0:                       #        0x40f407  0      OPC=0     
  leaq -0x10(%rsi,%r11,8), %rsi  #  54    0x40f407  5      OPC=1069  
  leaq -0x20(%rdi,%r11,8), %rdi  #  55    0x40f40c  5      OPC=1069  
  negq %r11                      #  56    0x40f411  3      OPC=1340  
  xorq %r8, %r8                  #  57    0x40f414  3      OPC=3763  
  xorl %ebx, %ebx                #  58    0x40f417  2      OPC=3758  
  movq %rax, %r10                #  59    0x40f419  3      OPC=1162  
  movq 0x18(%rsi,%r11,8), %rax   #  60    0x40f41c  5      OPC=1161  
  movq %rdx, %r9                 #  61    0x40f421  3      OPC=1162  
  jmpq .L_40f459                 #  62    0x40f424  5      OPC=930   
  nop                            #  63    0x40f429  1      OPC=1343  
  nop                            #  64    0x40f42a  1      OPC=1343  
  nop                            #  65    0x40f42b  1      OPC=1343  
.L_40f400:                       #        0x40f42c  0      OPC=0     
  movq %r10, (%rdi,%r11,8)       #  66    0x40f42c  4      OPC=1138  
  addq %rax, %r9                 #  67    0x40f430  3      OPC=72    
  movq (%rsi,%r11,8), %rax       #  68    0x40f433  4      OPC=1161  
  adcq %rdx, %r8                 #  69    0x40f437  3      OPC=29    
  movl $0x0, %r10d               #  70    0x40f43a  6      OPC=1154  
.L_40f414:                       #        0x40f440  0      OPC=0     
  mulq %rcx                      #  71    0x40f440  3      OPC=1318  
  movq %r9, 0x8(%rdi,%r11,8)     #  72    0x40f443  5      OPC=1138  
  addq %rax, %r8                 #  73    0x40f448  3      OPC=72    
  adcq %rdx, %rbx                #  74    0x40f44b  3      OPC=29    
.L_40f422:                       #        0x40f44e  0      OPC=0     
  movq 0x8(%rsi,%r11,8), %rax    #  75    0x40f44e  5      OPC=1161  
  mulq %rcx                      #  76    0x40f453  3      OPC=1318  
  movq %r8, 0x10(%rdi,%r11,8)    #  77    0x40f456  5      OPC=1138  
  addq %rax, %rbx                #  78    0x40f45b  3      OPC=72    
  adcq %rdx, %r10                #  79    0x40f45e  3      OPC=29    
.L_40f435:                       #        0x40f461  0      OPC=0     
  movq 0x10(%rsi,%r11,8), %rax   #  80    0x40f461  5      OPC=1161  
  mulq %rcx                      #  81    0x40f466  3      OPC=1318  
  movq %rbx, 0x18(%rdi,%r11,8)   #  82    0x40f469  5      OPC=1138  
  movl $0x0, %r8d                #  83    0x40f46e  6      OPC=1154  
  movq %r8, %rbx                 #  84    0x40f474  3      OPC=1162  
  addq %rax, %r10                #  85    0x40f477  3      OPC=72    
  movq 0x18(%rsi,%r11,8), %rax   #  86    0x40f47a  5      OPC=1161  
  movq %r8, %r9                  #  87    0x40f47f  3      OPC=1162  
  adcq %rdx, %r9                 #  88    0x40f482  3      OPC=29    
.L_40f459:                       #        0x40f485  0      OPC=0     
  mulq %rcx                      #  89    0x40f485  3      OPC=1318  
  addq $0x4, %r11                #  90    0x40f488  4      OPC=70    
  js .L_40f400                   #  91    0x40f48c  6      OPC=1043  
  nop                            #  92    0x40f492  1      OPC=1343  
  nop                            #  93    0x40f493  1      OPC=1343  
  movq %r10, (%rdi,%r11,8)       #  94    0x40f494  4      OPC=1138  
  addq %rax, %r9                 #  95    0x40f498  3      OPC=72    
  adcq %r8, %rdx                 #  96    0x40f49b  3      OPC=29    
  movq %r9, 0x8(%rdi,%r11,8)     #  97    0x40f49e  5      OPC=1138  
  addq %r8, %rdx                 #  98    0x40f4a3  3      OPC=72    
.L_40f474:                       #        0x40f4a6  0      OPC=0     
  movq %rdx, %rax                #  99    0x40f4a6  3      OPC=1162  
  popq %rbx                      #  100   0x40f4a9  1      OPC=1694  
  retq                           #  101   0x40f4aa  1      OPC=1978  
  nop                            #  102   0x40f4ab  1      OPC=1343  
  nop                            #  103   0x40f4ac  1      OPC=1343  
  nop                            #  104   0x40f4ad  1      OPC=1343  
  nop                            #  105   0x40f4ae  1      OPC=1343  
  nop                            #  106   0x40f4af  1      OPC=1343  
  nop                            #  107   0x40f4b0  1      OPC=1343  
  nop                            #  108   0x40f4b1  1      OPC=1343  
                                                                     
.size __gmpn_mul_1, .-__gmpn_mul_1

