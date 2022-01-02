
BASE_DIR=./
#release
CONFIG=debug

SRC_DIR=$(BASE_DIR)src/
SRC_NAMES=main.cpp physics.cpp game.cpp
SRCS=$(patsubst %.cpp,$(SRC_DIR)%.cpp, $(SRC_NAMES))

INC_DIR=$(BASE_DIR)inc/
INC_NAMES=$(SRC_NAMES:.cpp=.h)
INCS=$(patsubst %.h,$(INC_DIR)%.h, $(INC_NAMES))

OBJS_DIR=$(BASE_DIR)$(CONFIG)/out/
OBJ_NAMES=$(SRC_NAMES:.cpp=.o)
OBJS=$(patsubst %.o,$(OBJS_DIR)%.o, $(OBJ_NAMES))

OUT_DIR=$(BASE_DIR)$(CONFIG)/exe/
OUT_NAME=test.out
OUT=$(OUT_DIR)$(OUT_NAME)

CC=g++
CFLAGS=-I$(INC_DIR) -ggdb

SFML_LFLAGS=-lsfml-graphics -lsfml-window -lsfml-system
LFLAGS=-Xlinker -Map=$(OUT:.out=.map) $(SFML_LFLAGS)

all: link

rebuild: clean build

build: $(OBJS)

$(OBJS_DIR)%.o: $(SRC_DIR)%.cpp
	@echo "Compiling $@: $<"
	$(CC) -c $< -o $@ $(CFLAGS)

link: $(OUT)
$(OUT) : $(OBJS)
	$(CC) $^ -o $@ $(LFLAGS)

run:
	@sudo $(OUT)

clean:
	rm -f $(OBJS)
	rm -f $(OUT)
	rm -f $(OUT_DIR)*.map
