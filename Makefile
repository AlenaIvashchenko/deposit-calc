
CC = gcc
CFLAGS = -I CTEST -I src -Wall -Werror -MP -MMD
EXECUTABLE = deposit-calc
DIR = build/src
DAR = src
DUR = bin

EXECUTABLE_TEST = deposit-calc-test
DIT = build/test
DAT = test

all : $(DUR)/$(EXECUTABLE) Test1

$(DIR)/main.o: $(DAR)/main.c 
mkdir build -p
mkdir build/src -p
$(CC) $(CFLAGS) -c $(DAR)/main.c -o $(DIR)/main.o 

$(DIR)/deposit.o: $(DAR)/deposit.c
mkdir build -p
mkdir build/src -p
$(CC) $(CFLAGS) -c $(DAR)/deposit.c -o $(DIR)/deposit.o 

$(DUR)/$(EXECUTABLE): $(DIR)/main.o $(DIR)/deposit.o
mkdir bin -p
$(CC) $(DIR)/main.o $(DIR)/deposit.o -o $(DUR)/$(EXECUTABLE) 

Test1: $(DUR)/$(EXECUTABLE_TEST)

$(DUR)/$(EXECUTABLE_TEST): $(DIT)/main.o $(DIT)/deposit_test.o $(DIR)/deposit.o $(DIT)/validation_test.o 
mkdir bin -p
$(CC) $(DIT)/main.o $(DIT)/deposit_test.o $(DIR)/deposit.o $(DIT)/validation_test.o -o $(DUR)/$(EXECUTABLE_TEST) 

$(DIT)/main.o: $(DAT)/main.c
mkdir build -p
mkdir build/test -p
$(CC) $(CFLAGS) -c $(DAT)/main.c -o $(DIT)/main.o 

$(DIT)/deposit_test.o: $(DAT)/deposit_test.c
mkdir build -p
mkdir build/test -p
$(CC) $(CFLAGS) -c $(DAT)/deposit_test.c -o $(DIT)/deposit_test.o 

$(DIT)/validation_test.o: $(DAT)/validation_test.c
mkdir build -p
mkdir build/test -p
$(CC) $(CFLAGS) -c $(DAT)/validation_test.c -o $(DIT)/validation_test.o 

.PHONY: clean 
clean :
rm -rf build/* bin/*
