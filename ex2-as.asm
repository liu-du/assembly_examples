/* This is AT&T syntax */
.global _start

.data
msg:
    .ascii "Hello, world!\n"
    len = . - msg

.text
_start:
    mov $4, %eax
    mov $1, %ebx
    mov $msg, %ecx
    mov $len, %edx
    int $0x80
    mov $1, %eax
    mov $0, %ebx
    int $0x80
