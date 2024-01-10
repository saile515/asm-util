test : test.o
		gcc -z noexecstack -no-pie -o build/test build/test.o

test.o : builddir
		nasm -felf64 -F dwarf main.asm -o build/test.o

builddir : 
		mkdir -p build

clean : 
		rm build/test.o
