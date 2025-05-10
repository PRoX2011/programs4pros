[BITS 16]
[ORG 800h]

start:
    mov ax, 0x13
    int 0x10
    call draw_squares

    mov ah, 0x00
    int 0x16

    mov ah, 0x00
    mov al, 0x13
    int 0x10

    call draw_triangle

    mov ah, 0x00
    int 0x16
    mov ax, 0x03
    int 0x10
    int 0x19

draw_squares:
    push ax
    push bx
    push cx
    push dx
    mov ax, 50
    mov bx, 30
    mov cx, 20
    call draw_square
    mov ax, 80
    mov bx, 50
    mov cx, 20
    call draw_square
    mov ax, 60
    mov bx, 70
    mov cx, 20
    call draw_square
    pop dx
    pop cx
    pop bx
    pop ax
    ret

draw_square:
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    mov si, ax
    mov di, bx
    mov dx, cx

    mov ax, si
    mov bx, di
    mov cx, si
    add cx, dx
    mov dx, di
    mov byte [triangle_color], 0x0E
    call draw_line

    mov ax, si
    mov bx, di
    add bx, dx
    mov cx, si
    add cx, dx
    mov dx, bx
    call draw_line

    mov ax, si
    mov bx, di
    mov cx, si
    mov dx, di
    add dx, dx
    call draw_line

    mov ax, si
    add ax, dx
    mov bx, di
    mov cx, ax
    mov dx, di
    add dx, dx
    call draw_line

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

draw_triangle:
    mov byte [triangle_color], 0x0A

    mov ax, 100
    mov bx, 50
    mov cx, 200
    mov dx, 150
    call draw_line

    mov ax, 200
    mov bx, 150
    mov cx, 50
    mov dx, 150
    call draw_line

    mov ax, 50
    mov bx, 150
    mov cx, 100
    mov dx, 50
    call draw_line

    ret

draw_line:
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    push bp

    mov ah, 0x0C
    mov al, byte [triangle_color]

    mov si, cx
    mov di, dx
    sub si, ax

    mov bp, 1
    cmp si, 0
    jge .dx_positive
    neg si
    mov bp, -1
.dx_positive:

    mov cx, di
    sub cx, bx

    mov dx, 1
    cmp cx, 0
    jge .dy_positive
    neg cx
    mov dx, -1
.dy_positive:

    cmp si, cx
    jl .y_dominant

    mov di, si
    shr si, 1

.x_loop:
    push dx
    mov dx, bx
    mov cx, ax
    int 0x10
    pop dx
    add ax, bp
    add si, cx
    jc .y_step
    dec di
    jz .done
    jmp .x_loop

.y_step:
    add bx, dx
    sub si, di
    dec di
    jz .done
    jmp .x_loop

.y_dominant:
    mov di, cx
    shr cx, 1

.y_loop:
    push dx
    mov dx, bx
    mov cx, ax
    int 0x10
    pop dx
    add bx, dx
    add cx, si
    jc .x_step
    dec di
    jz .done
    jmp .y_loop

.x_step:
    add ax, bp
    sub cx, di
    dec di
    jz .done
    jmp .y_loop

.done:
    pop bp
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

triangle_color db 0x0E

times 510-($-$$) db 0
dw 0xAA55