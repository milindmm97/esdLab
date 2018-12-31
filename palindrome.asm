        NAME    main
        PUBLIC  __iar_program_start
        SECTION .datas:CONST (2)
string dcb "malayalam"  ;input is palindrome
string_end dcb 0x00
string_rev DS8 15
        SECTION .intvec:CODE:NOROOT (2)
__iar_program_start
main
        adr r0,string           ;r0 is pointer to string
        mov r10,r0              ;duplicate r10 pointer to string
        adr r1,string_end
        adr r2,string_rev       ;r2 is pointer to string end
        mov r11,r2              ;duplicate r11 pointer to string_rev
        sub r3,r1,r0            ; r3 is length 
        mov r4,r3
        mov r5,r4               ;length is duplicated
        sub r3,r3,#1
        sub r4,r4,#2
        add r0,r0,r4
        
rev     ldrb r6,[r0]
        strb r6,[r2]
        add r2,r2,#1
        sub r0,r0,#1
        sub r3,r3,#1
        cmp r3,#0
        bne rev 
        
check   ldrb r6,[r10]
        ldrb r7,[r11]
        cmp r6,r7
        bne not_pal
        sub r5,r5,#1
        cmp r5,#0
        bne check 
        beq pal

not_pal mov r8,#0               ;r8 is the flag 
        b stop                  ; if r8 is 1 it is palindrome
pal     mov r8,#1               ;if r8 is 0 it is not a palindrome
        b stop 
        
stop    b stop 
        end 
        
