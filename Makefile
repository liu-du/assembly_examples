ALL=ex1 ex1.o ex2 ex2.o ex2-as ex2-as.o ex5 ex5.o stack stack.o function function.o

all: $(ALL)

ex2-as.o: ex2-as.asm # use gnu as
	as -march=i386 --32 -o $@ $^

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
