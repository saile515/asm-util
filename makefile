test : test.o
		ld -o build/test build/test.o

test.o : builddir
		nasm -felf64 -F dwarf -g main.asm -o build/test.o

builddir : 
		mkdir -p build

clean : 
		rm build/test.o
