        NAME main 
        PUBLIC __iar_program_start 
        SECTION .datas:CONST (2)
data dcb 0x01,0x02,0x03,0x04            ;data in 8 bit form m
        SECTION .intvec:CODE:NOROOT (2)
__iar_program_start
main
        adr r0,data     ;pointer to unpacked BCD
        mov r2,#0
        mov r5,#4       ;counter (number of digits)
        mov r10,#10     ;multiplier 
        
conv    ldrb r1,[r0],#1 ;post index auto increament on pointer
        add r2,r2,r1    ;r2 will have the result
        sub r5,r5,#1    ; counter --
        cmp r5,#0 
        beq done 
        mul r2,r2,r10
        b conv 
done    b stop 
stop    b stop 
        end 
        
