# Programs for x16 PRos
Collection of programs for the [x16 PRos operating system](https://github.com/PRoX2011/x16-PRos/), which can be loaded using the load command.

At the time of version 16-Pros 0.3 free sectors are 45-50 and you can write your programs to them using dd:
```bash
dd if=[Your program.bin] of=x16pros.img bs=512 seek=[Sector number] conv=notrunc
```
The program should occupy one disk sector (512 bytes). If your program takes up more space, please recompile the system by changing the start_program function:
```nasm
start_program:
    pusha
    mov ah, 0x02
    mov al, [program size in sectors]
    mov ch, 0
    mov dh, 0
    mov cl, [sector_number]
    mov bx, [program offset (recomended 900h or 800h)]
    int 0x13
    jc .disk_error
    jmp 800h
    ret
```
In order to better understand the principle of launching programs, I recommend looking at the source code of the system kernel and its programs.

---

# Programs

### **1.** Hello-pros 

by PRoX2011 | [Download](https://github.com/PRoX2011/programs4pros/blob/main/hello-pros/)

**Size: lower than 1 disk sector**

A minimal program for x16-PRos that displays the phrase "Hello, from x16-PRos!" and terminates its work after pressing any key.

![hello-pros](https://github.com/PRoX2011/programs4pros/blob/main/hello-pros/hello-pros.png)

---

### **2.** Screen-saver

by Loxsete | [Download](https://github.com/PRoX2011/programs4pros/blob/main/screen-saver/)

**Size: 1 disk sector**

Endless animated screensaver for x16-PRos working in graphics (320x200) mode.

<img src="https://github.com/PRoX2011/programs4pros/blob/main/screen-saver/screen-saver.gif" width="65%">

---
