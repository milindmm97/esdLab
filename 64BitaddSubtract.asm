        NAME main
        PUBLIC __iar_program_start 
        SECTION .datas:CONST (2)
data dcd 0x12345678,0x23456789,0xABCDEF12,0xDEFABC45 ;64 bit numbers are DEFABC45ABCDEF12 and 2345678912345678
        SECTION .intvec:CODE:NOROOT (2)
        
__iar_program_start 
main    
;addition 
        adr r0,data
        ldmia r0!,{r1-r4}
        adds r5,r3,r1
        adc r6,r4,r2
        addcs r7,r7,#1
        ;r7,r6 and r5 are the sum 
;subtraction 
        subs r8,r3,r1
        subcs r9,r4,r2
        subcc r10,r10,#1
stop    b stop 
        end
