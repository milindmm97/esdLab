;Palindrome with string reversal 

        NAME    main
        
        PUBLIC  __iar_program_start
        SECTION .datas:CONST (2)
string dcb "reverse"
string_end dcb 0x00
string_rev ds8 15

        SECTION .intvec:CODE:NOROOT (2)
__iar_program_start
main
       adr r0,string            ;r0 is pointer to string
       adr r1,string_end        ;r1 is pointer to string_end
       adr r2, string_rev       ;r2 is pointer to string_rev
       
       sub r3,r1,r0             ;r3 holds length of the string
       mov r4,r3                ;duplicate for counter value 
       sub r3,r3,#1
       sub r4,r4,#2             ;r4 is used to point to end of string
       
       add r0,r0,r4             ;r0 now points to end of string
       
rev    ldrb r6,[r0]             ;NOTE: important to use ldrb and strb
       strb r6,[r2]
       sub r0,r0,#1
       add r2,r2,#1
       sub r3,r3,#1
       cmp r3,#0
       bne rev 
stop   b stop 
       end 
