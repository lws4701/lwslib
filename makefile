clean:
	rm -rf *.dylib
	rm -rf *.a
	find ./ -name '*.o' -delete
dynamic:
	clang -O3 -Wall -Werror -pedantic -fPIC -c -o ./src/datastructures/arraylist.o ./src/datastructures/arraylist.c
	clang -O3 -Wall -Werror -pedantic -fPIC -c -o ./src/random/randomdatagenerators.o ./src/random/randomdatagenerators.c
	clang -shared -o liblwslib.dylib ./src/datastructures/arraylist.o

static:
	clang -O3 -c -o ./src/datastructures/arraylist.o ./src/datastructures/arraylist.c
	clang -O3 -Wall -Werror -pedantic -c -o ./src/random/randomdatagenerators.o ./src/random/randomdatagenerators.c
	ar -rcs liblwslib.a ./src/datastructures/arraylist.o

all:
	make dynamic
	make static