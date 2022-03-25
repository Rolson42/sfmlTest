
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

SFML_INC_DIR=/usr/local/include
SFML_LIB_DIR=/usr/local/lib

#SFML_LIB_NAMES=libsfml-audio-s.a libsfml-graphics-s.a libsfml-network-s.a libsfml-system-s.a libsfml-window-s.a
SFML_LIB_NAMES=sfml-graphics sfml-window sfml-system

SFML_LFLAGS=-L$(SFML_LIB_DIR) $(patsubst %,-l%, $(SFML_LIB_NAMES))
#SFML_LFLAGS=$(SFML_LIBS)
#SFML_LFLAGS=-l$(SFML_LIB_DIR)sfml-graphics.a -l$(SFML_LIB_DIR)sfml-window -l$(SFML_LIB_DIR)sfml-system



CC=g++
CFLAGS=-I$(INC_DIR) -I$(SFML_INC_DIR) -ggdb -std=c++17



LFLAGS=-Xlinker -Map=$(OUT:.out=.map)

all: link

rebuild: clean build

build: $(OBJS)

$(OBJS_DIR)%.o: $(SRC_DIR)%.cpp
	@echo "Compiling $@: $<"
	$(CC) -c $< -o $@ $(CFLAGS)

link: $(OUT)
$(OUT) : $(OBJS)
	$(CC) $^ -o $@ $(SFML_LFLAGS)

run:
	# export LD_LIBRARY_PATH=$(SFML_LIB_DIR) &&
	$(OUT)

clean:
	rm -f $(OBJS)
	rm -f $(OUT)
	rm -f $(OUT_DIR)*.map
