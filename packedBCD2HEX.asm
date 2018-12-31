        NAME main 
        PUBLIC __iar_program_start 
        SECTION datas:CONST (2)
num dc16 0x1234
result ds32 10
        SECTION .intvec:CODE:NOROOT (2)
__iar_program_start
main
        adr r0,num
        mov r5,#4       ;number for digits in packed bcd
        mov r10,#10     ;multiplier 
        mov r11,#0x0F    ;for anding
        mov r9,#12      ;for rotating
        mov r1,#0
        mov r2,#0       ;clear registers

conv    mov r7,r1
        mul r1,r7,r10   ;multiply with 10 
        ldrh r8,[r0]
        ror r8,r8,r9
        and r4,r8,r11
        add r1,r1,r4
        sub r9,r9,#4   ;reduce count of rotate 
        sub r5,r5,#1    ;reduce overall count
        cmp r5,#0
        bne conv
        adr r2,result
        str r1,[r2]
stop    b stop 
        end
