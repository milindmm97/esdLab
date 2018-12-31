        NAME    main
        
        PUBLIC  __iar_program_start
        
        SECTION datas:CONST (2)
data dcd 0x0A,0x00    ;number to find the factorial
                       
        SECTION .intvec:CODE:NOROOT (2)

__iar_program_start

main 
        ldr r0, =data
        ldr r1,[r0]             ;r1 holds the number. r0 holds the address
        
        ;check for zero
        cmp r1,#0
        BEQ zero 
        ;jump to zero method
        
        ;check for one
        cmp r1,#1
        BEQ one 
        ;jump to one method
        
        mov r2,r1       ;duplicate
        mov r3,r1       ;set as counter and multiplier 
fact    sub r3,r3,#1
        mul r1,r3,r1
        cmp r3,#1
        bne fact 
        b stop 
        
zero    mov r1,#1
        b stop 

one     b stop 

stop    b stop 
        END 
        ;r1 hold the factorial 
