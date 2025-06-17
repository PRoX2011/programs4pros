# Programs for x16 PRos
Collection of programs for the [x16 PRos operating system](https://github.com/PRoX2011/x16-PRos/), which can be loaded by pros terminal.

At the time of version 16-Pros 0.4 you can copy your programs to disk image using `mcopy`:
```bash
mcopy -i disk_img/x16pros.img PROGRAM.BIN ::/
```
The program maximum size is 32KB. If your program takes up more space, please recompile the system by changing the `disk_buffer` in `kernel.asm` file.
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
