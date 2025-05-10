[BITS 16]
[ORG 800h]

start:
    ; Clear screen
    mov ax, 0x12
    int 0x10
    
    ; Display message
    mov si, hello_msg
    call print_string
    
    ; Wait for key press
    mov ah, 0x00
    int 0x16
    
    ; Terminate program
    int 0x19

print_string:
    mov ah, 0x0E
    mov bl, 0x0F
.print_char:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .print_char
.done:
    ret

hello_msg db 'Hello, x16 PRos!', 0