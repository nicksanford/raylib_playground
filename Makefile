CWFLAGS = -Wall -Wextra -Wpedantic -Wconversion  -Wnull-dereference -Wdouble-promotion -Wno-switch-enum -Wshadow -Wunused -Wenum-conversion -Wno-unused-function -Wuninitialized -Wno-sign-conversion -Wno-conversion -Wno-unused-parameter -Werror 
COPTIONS = -g -fdata-sections -ffunction-sections -fno-omit-frame-pointer -fsanitize-address-use-after-scope -fno-common -ggdb -fsanitize=address
CFLAGS = $(COPTIONS) $(CWFLAGS) -I./raylib/src -I./raygui/src -I ./raygui/styles/cherry/ 
LDFLAGS = -L./raylib/src
LDLIBS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

all: raylib/src/libraylib.a
	$(MAKE) clean
	$(MAKE) main

raylib/src/libraylib.a:
	cd raylib/src && $(MAKE) PLATFORM=PLATFORM_DESKTOP

clean:
	rm -rf main

clean-all: clean
	cd raylib/src && $(MAKE) clean
