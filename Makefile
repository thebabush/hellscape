# WARNING(babush): I can't write Makefiles

all: hellscape

test: hellscape
	hellscape

hellscape: objs/hellscape.o objs/main.o
	gcc -m32 -o hellscape objs/hellscape.o objs/main.o

objs/hellscape.o: objs srcs/hellscape.asm
	nasm -g -f elf32 -o objs/hellscape.o srcs/hellscape.asm

objs/main.o: objs srcs/main.c
	gcc -m32 -o objs/main.o -c srcs/main.c

objs:
	mkdir -p objs

clean:
	rm -rf objs
	rm hellscape

