      NAME main 
      PUBLIC __iar_program_start 
      SECTION .datas:CONST(2)
data dcd 0x05
data_result ds32 1
      SECTION .intvec:CODE:NOROOT (2)
      
__iar_program_start

main
  code32
      ldr r0,data
      ldr r1,=thumbcode
      mov lr,pc                 
      bx r1
      adr r10,data_result
      str r6,[r10]
stop  b stop 
  code16                ;thumbcode begins
thumbcode 
      mov r6,r0
      mov r4,r6
loop  sub r4,#1
      mul r6,r4
      cmp r4,#1
      bne loop 
      bx lr
      end
