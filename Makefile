asm=read.asm
obj=read.o
bin=read

all: ${bin}

${bin}: ${obj}
	clang -o ${bin} $^ -no-pie

${obj}: ${asm}
	nasm -f elf64 -g -F dwarf $^

clear:
	rm ${bin} ${obj}


