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

all: $(DUR)/$(EXECUTABLE) 
$(DIR)/main.o: $(DAR)/main.c 
	@if [ ! -d $(DIR) ] ; then echo "creating $(DIR)" ; mkdir build ; mkdir build/src; fi
	$(CC) $(CFLAGS) -c $(DAR)/main.c -o $(DIR)/main.o 

$(DIR)/deposit.o: $(DAR)/deposit.c
	@if [ ! -d $(DIR) ] ; then echo "creating $(DIR)" ; mkdir build ; mkdir build/src; fi
	$(CC) $(CFLAGS) -c $(DAR)/deposit.c -o $(DIR)/deposit.o 

$(DUR)/$(EXECUTABLE): $(DIR)/main.o $(DIR)/deposit.o
	@if [ ! -d $(DUR) ] ; then echo "creating $(DUR)" ; mkdir bin ; mkdir bin/deposit-calc1; fi
	$(CC) $(DIR)/main.o $(DIR)/deposit.o -o $(DUR)/$(EXECUTABLE) 

 
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
