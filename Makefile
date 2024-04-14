MACOSX_DEPLOYMENT_TARGET ?= 14.0.0
CC ?= clang
PLATFORM ?= $(shell uname -s)-$(shell uname -m)
BIN_OUTPUT_PATH ?= bin/$(PLATFORM)
RAYLIB_VERSION ?= 5.0
CWFLAGS ?= -Wall -Wextra -Wpedantic -Wconversion -Wsign-conversion -Wnull-dereference -Wdouble-promotion -Wno-switch-enum -Wno-signed-enum-bitfield -Wshadow -Wunused -Wenum-conversion -Wno-assign-enum -Wno-unused-function -Wno-unused-command-line-argument -Wuninitialized -Werror 
COPTIONS ?= -g -fdata-sections -ffunction-sections -fno-omit-frame-pointer -fsanitize-address-use-after-scope -fsanitize-address-use-odr-indicator -fsanitize-cfi-cross-dso -fno-common -ggdb -fsanitize=address 

ifeq ($(PLATFORM),Darwin-arm64)
LDFLAGS += -framework CoreVideo -framework Cocoa -framework IOKit         -framework GLUT -framework OpenGL
else
	echo $(PLATFORM) not yet supported. Please edit Makefile
	exit 1
endif

.PHONY: build

build: raylib/src/libraylib.a src/*.c
	mkdir -p $(BIN_OUTPUT_PATH)
	$(CC) $(CWFLAGS) $(COPTIONS) -I./raylib/src $(LDFLAGS) ./raylib/src/libraylib.a src/main.c -o $(BIN_OUTPUT_PATH)/main 

raylib/src/libraylib.a: raylib
	cd raylib/src && MACOSX_DEPLOYMENT_TARGET=${MACOSX_DEPLOYMENT_TARGET} make

raylib:
	git clone https://github.com/raysan5/raylib.git --branch $(RAYLIB_VERSION) 

clean:
	rm -rf bin && cd raylib/src && make clean
