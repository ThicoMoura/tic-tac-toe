PROJ_NAME=tic-tac-toe

C_SOURCE=$(wildcard ./src/*.c)

H_SOURCE=$(wildcard ./src/*.h)

BIN_SOURCE=./bin/$(PROJ_NAME)

OBJ=$(subst .c,.o,$(subst src,obj,$(C_SOURCE)))

CC=gcc

CC_FLAGS=-c         \
         -W         \
         -Wall      \
         -ansi      \
         -pedantic  \
		 -std=c11

RM = rm -rf	 

all: folder $(PROJ_NAME)

$(PROJ_NAME): $(OBJ)
	@ echo 'Building binary using GCC linker: $@'
	$(CC) $^ -o $(BIN_SOURCE)
	@ echo 'Finished building binary: $@'
	@ echo ' '
 
./obj/%.o: ./src/%.c ./src/%.h
	@ echo 'Building target using GCC compiler: $<'
	$(CC) $< $(CC_FLAGS) -o $@
	@ echo ' '
 
./obj/main.o: ./src/main.c $(H_SOURCE)
	@ echo 'Building target using GCC compiler: $<'
	$(CC) $< $(CC_FLAGS) -o $@
	@ echo ' '
 
folder:
	@ mkdir -p obj bin
 
clean:
	@ $(RM) ./obj/*.o $(BIN_SOURCE) *~
	@ rmdir obj bin
 
.PHONY: all clean