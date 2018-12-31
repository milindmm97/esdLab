        NAME    main
        
        PUBLIC  __iar_program_start
        SECTION .datas:CONST (2)
data dcd 0x05,0x03
;expected 5C3 = 10 or A in hex in r4
        SECTION .intvec:CODE:NOROOT (2)
__iar_program_start
main
        adr r0,data
        ldmia r0!,{r1-r2} ;r1=n and r2=r
        ;find n-r!
        ;find n!
        ;find r!
        ;find n-r! x r! = p
        ;find n! / p
        
        ;r3 has n-r
        sub r3, r1,r2
 
        ;finding n!
step1   cmp r1,#0
        beq zeros1
        cmp r1,#1
        beq ones1
        mov r10,r1
fact1   sub r10,r10,#1
        mul r1,r10,r1
        cmp r10,#1
        bne fact1
        b step2
zeros1  mov r1,#1
        b step2
ones1   b step2
        ; finding r!
step2   cmp r2,#0
        beq zeros2
        cmp r2,#1
        beq ones2
        mov r10,r2
fact2   sub r10,r10,#1
        mul r2,r10,r2
        cmp r10,#1
        bne fact2
        b step3
zeros2  mov r2,#1
        b step3
ones2   b step3

        ; finding n-r!
step3   cmp r3,#0
        beq zeros3
        cmp r3,#1
        beq ones3
        mov r10,r3
fact3   sub r10,r10,#1
        mul r3,r10,r3
        cmp r10,#1
        bne fact3
        b next
zeros3  mov r2,#1
        b next
ones3   b next

next    mul r2,r2,r3
        b div 
        ;r2 now holds p
        mov r4,#0
;division of r1/r2 and r4 will hold quotient
div    sub r1,r1,r2
       add r4,r4,#1
       cmp r1,r2
       bge div
       bmi done
       
done  b stop 
 
 ;r4 hold the answer 
stop    b stop 
        end 
