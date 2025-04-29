CFLAGS = -I./raylib/src -I./raygui/src -I ./raygui/styles/cherry/ -g
LDFLAGS = -L./raylib/src
LDLIBS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

all: raylib/src/libraylib.a
	$(MAKE) main

raylib/src/libraylib.a:
	cd raylib/src && $(MAKE) PLATFORM=PLATFORM_DESKTOP

clean:
	rm -rf main

clean-all: clean
	cd raylib/src && $(MAKE) clean
