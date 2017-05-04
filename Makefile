CC = gcc
CFLAGS = -I thirdparty -I src -c -Wall -Werror
EXECUTABLE = file 
SOURCES = main.c deposit.c 
DIR = build
DAR = src
DUR = bin

all: $(DUR)/$(EXECUTABLE) 
$(DIR)/main.o: $(DAR)/main.c 
	@if [ ! -d $(DIR) ] ; then echo "creating $(DIR)" ; mkdir build ;fi
	$(CC) $(CFLAGS) -c $(DAR)/main.c -o $(DIR)/main.o 

$(DIR)/deposit.o: $(DAR)/deposit.c
	@if [ ! -d $(DIR) ] ; then echo "creating $(DIR)" ; mkdir build ;fi
	$(CC) $(CFLAGS) -c $(DAR)/deposit.c -o $(DIR)/deposit.o 

$(DUR)/$(EXECUTABLE): $(DIR)/main.o $(DIR)/deposit.o
	@if [ ! -d $(DUR) ] ; then echo "creating $(DUR)" ; mkdir bin ;fi
	$(CC) $(DIR)/main.o $(DIR)/deposit.o -o $(DUR)/$(EXECUTABLE) 

 .PHONY : clean
clean:
	rm -rf build/* bin/* 
