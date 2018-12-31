          NAME main 
          PUBLIC __iar_program_start 
          SECTION .datas:CONST (2)
data dcd 0x05,0x3,0x0F,0x02
data_end dcd 0x00
data_length dcd (data_end - data)/4
          SECTION .intvec:CODE:NOROOT (2)
__iar_program_start
main 
          ldr r0,=data
          ldr r1,data                   ;r1 holds the smallest number
          ldr r2,data                   ;r2 hold the largest number
          ldr r3,data_length            
          sub r3,r3,#1                  ;r3 is the counter
          ldr r4,=thumbcode 
          mov lr,pc 
          bx r4
stop      b stop 
  code16
thumbcode
loop      add r0,#4
          ldr r5,[r0]
          cmp r5,r1
          bpl cont
          mov r1,r5
cont      cmp r5,r2
          bmi check
          mov r2,r5
check     sub r3,#1
          cmp r3,#0
          bne loop 
          bx lr 
          end
