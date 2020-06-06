ALL=ex1 ex1.o ex2 ex2.o ex2-as ex2-as.o ex5 ex5.o stack stack.o function function.o 
# ex10 ex10.o
# add42.o ex11

all: $(ALL)

ex2-as.o: ex2-as.asm # use gnu as
	as -march=i386 --32 -o $@ $^

# ex11: add42.o # not working... probably because i'm on 64 bit, need some extra packages
# 	gcc -m32 add42.o main.c -o ex11

# ex10: ex10.o # not working...
# 	gcc -m32 $^ -o $@

%.o: %.asm # use nasm
	nasm -f elf32 $*.asm -o $*.o

%: %.o
	ld -m elf_i386 $*.o -o $*

clean:
	-rm $(ALL)


build:
	docker build . -t gcc:asm

shell:
	docker run -it --rm -v $(shell pwd):/app -w /app gcc:asm bash
