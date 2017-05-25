CC = gcc
CFLAGS = -Wall -Werror -MP -MMD
EXECUTABLE = deposit-calc
DIR = build
DAR = src
DUR = bin

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

.PHONY: clean 
clean :
	@echo "Cleaning files in build directory"
	rm build/*


-include build/*.d
