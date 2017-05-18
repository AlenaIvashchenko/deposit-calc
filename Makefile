CC = gcc
CFLAGS = -ICTEST -Isrc -c -Wall -Werror
EXECUTABLE = file 
SOURCES = main.c deposit.c 
OBJECTS = $(SOURCES: .c=.o)
DIR = build
DAR = src
DUR = bin/deposit-calc1

EXECUTABLE_TEST = testik
SOURCES_TEST = deposit_test.c main.c validation_test.c
OBJECTS_TEST = $(SOURCES_TEST: .c=.o)
DIT = build/test1
DAT = test
DUT = bin/deposit-calc-test3

all: bin/deposit-calc1/file 
build/main.o: src/main.c 
	mkdir build -p
	gcc -Wall -Werror -c -o build/main.o src/main.c -MP -MMD

build/deposit.o: src/deposit.c
	mkdir build -p
	gcc -Wall -Werror -c -o build/deposit.o src/deposit.c -MP -MMD

bin/deposit-calc/file: build/main.o build/deposit.o
	mkdir bin -p
	gcc -Wall -Werror -o bin/deposit-calc build/deposit.o build/main.o

 
test: $(DUT)/$(EXECUTABLE_TEST)
$(DIT)/main.o: $(DAT)/main.c 
	@if [ ! -d $(DIT) ] ; then echo "creating $(DIT)" ; mkdir build; mkdir build/test1; fi
	$(CC) $(CFLAGS) -c $(DAT)/main.c -o $(DIT)/main.o 

$(DIT)/deposit_test.o: $(DAT)/deposit_test.c
	@if [ ! -d $(DIT) ] ; then echo "creating $(DIT)" ; mkdir build; mkdir build/test1; fi
	$(CC) $(CFLAGS) -c $(DAT)/deposit_test.c -o $(DIT)/deposit_test.o 

$(DIT)/validation_test.o: $(DAT)/validation_test.c
	@if [ ! -d $(DIT) ] ; then echo "creating $(DIT)" ; mkdir build; mkdir build/test1; fi
	$(CC) $(CFLAGS) -c $(DAT)/validation_test.c -o $(DIT)/validation_test.o 

$(DUT)/$(EXECUTABLE_TEST): $(DIT)/main.o $(DIT)/deposit_test.o $(DIT)/validation_test.o $(DAR)/deposit.o
	@if [ ! -d $(DUT) ] ; then echo "creating $(DUT)" ; mkdir bin; mkdir bin/deposit-calc-test3; fi
	$(CC) $(DIT)/main.o $(DIT)/deposit_test.o $(DIT)/validation_test.o $(DIR)/deposit.o -o $(DUT)/$(EXECUTABLE_TEST) 


.PHONY : clean
clean:
	rm -rf build/src/*.o build/test1/*.o bin/deposit-calc/* bin/deposit-calc-test3/*
