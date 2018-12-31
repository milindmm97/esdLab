   
        PUBLIC  __iar_program_start
        
        SECTION datas:CONST (2) 
data dcd 0x1111, 0x1, 0x5452, 0x9986, 0x5405, 0x4807, 0x04444, 0xFFFA, 0x09999, 0xAAAA
dataend dcd 0x00

length dcd (dataend - data)/4

        
        SECTION .intvec:CODE:NOROOT (2)


__iar_program_start
main 
                                 // initilaize lenght 
full ldr r0, length             // data length in r0 
     sub r0,r0,#1
     adr r1, data               //address of data block in r1
     mov r12, #0                // flag 
     
     mov r2, r1                 // r1 and r2 are pointers
     add r2, r2,#4
     
loop ldr r3, [r1]               // load data in r3 and r4        
     ldr r4, [r2]
     cmp r3, r4
     
     blo cont                 //for ascending
     bhs cont                 // for descending
     str r3,[r2]
     str r4,[r1]
     mov r12,#1
     
cont add r1,r1,#4
     add r2,r2,#4
     sub r0,r0,#1
     cmp r0,#0
     bne loop 
     
     cmp r12,#0
     bne full 
     
     
     
stop b stop
       
        END
