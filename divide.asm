//Division is needed fro nCr 
        NAME    main
        
        PUBLIC  __iar_program_start
        
        SECTION datas:CONST (2)
data dcd 0xA,0x02      ;divisor and dividend
 ;result expected in 0x05 in r5                      
        SECTION .intvec:CODE:NOROOT (2)
        
__iar_program_start
main    
        adr r0,data
        ldmia r0!,{r1-r2}       ;load multiple increament after 
        mov r5,#0       ;r5 is the quotient
div
        sub r1,r1,r2
        add r5,r5,#1
        cmp r1,r2
        bge div 
        bmi done
done    b stop

stop    b stop 
        END 
        
