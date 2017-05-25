CC = gcc
CFLAGS = -Wall -Werror -MP -MMD
EXECUTABLE = deposit-calc
DIR = build
DAR = src
DUR = bin

EXECUTABLE_TEST = deposit-calc-test
DIT = build/test
DAT = test


all :
	make $(DUR)/$(EXECUTABLE)

$(DIR)/main.o: $(DAR)/main.c $(DAR)/deposit.h
	mkdir build -p
	$(CC) $(CFLAGS) -c $(DAR)/main.c -o $(DIR)/main.o 

$(DIR)/deposit.o: $(DAR)/deposit.c $(DAR)/deposit.h
	mkdir build -p
	$(CC) $(CFLAGS) -c $(DAR)/deposit.c -o $(DIR)/deposit.o 

$(DUR)/$(EXECUTABLE): $(DIR)/main.o $(DIR)/deposit.o
	mkdir bin -p
	$(CC) $(DIR)/main.o $(DIR)/deposit.o -o $(DUR)/$(EXECUTABLE) 
Test1: 
	make test $(DUR)/$(EXECUTABLE_TEST)

$(DUR)/$(EXECUTABLE_TEST): $(DIT)/main.o $(DIT)/deposit_test.o
	mkdir bin -p
	$(CC) $(DIT)/main.o $(DIT)/deposit_test.o $(DIT)/deposit.o -o $(DUR)/$(EXECUTABLE_TEST) 

$(DIT)/main.o: $(DAT)/main.c $(DAR)/deposit.h
	mkdir build -p
	mkdir build/test -p
	$(CC) $(CFLAGS) -c $(DAT)/main.c -o $(DIT)/main.o 
	$(CC) $(CFLAGS) -c $(DAR)/deposit.c $(DIT)/deposit.o

$(DIT)/deposit_test.o: $(DAT)/deposit_test.c $(DAR)deposit.h
	mkdir build -p
	mkdir build/test -p
	$(CC) $(CFLAGS) -c $(DAT)/deposit_test.c -o $(DIT)/deposit_test.o 

$(DIT)/deposit.o : $(DAR)/deposit.h $(DAR)/deposit.c
	mkdir build -p
	mkdir build/test -p
	$(CC) $(CFLAGS) -c $(DAR)/deposit.c -o $(DIT)/deposit.o 


.PHONY: clean 
clean :
	@echo "Cleaning files in build directory"
	rm build/*


-include build/*.d
