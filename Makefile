CFLAGS = -I./raylib/src -I./raygui/src
LDFLAGS = -L./raylib/src
LDLIBS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

all: raylib/src/libraylib.a
	$(MAKE) main

raylib/src/libraylib.a:
	cd raylib/src && $(MAKE) PLATFORM=PLATFORM_DESKTOP

clean:
	cd raylib/src && $(MAKE) clean
	rm -rf main
