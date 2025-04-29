CFLAGS = -I./raylib/src
LDFLAGS = -L./raylib/src
LDLIBS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

all: raylib/src/libraylib.a
	$(MAKE) main


raylib/src/libraylib.a:
	cd raylib/src && $(MAKE) PLATFORM=PLATFORM_DESKTOP

clean:
	cd raylib/src && $(MAKE) clean
	rm -rf main


# build:
# 	mv src/raygui.h src/raygui.c
# 	gcc -o raygui.so src/raygui.c -shared -fpic -DRAYGUI_IMPLEMENTATION -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
# 	mv src/raygui.c src/raygui.h


