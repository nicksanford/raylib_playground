#include "raylib.h"

#define RAYGUI_IMPLEMENTATION
#include "raygui.h"

int main(void) {
  // GuiLoadStyleCherry();
  InitWindow(400, 200, "raygui - controls test suite");
  SetTargetFPS(60);

  bool showMessageBox = false;

  // GuiLoadStyle("./raygui/styles/cherry/style_cherry.txt.rgs");
  GuiLoadStyle("./raygui/styles/dark/style_dark.txt.rgs");
  while (!WindowShouldClose()) {
    // Draw
    //----------------------------------------------------------------------------------
    BeginDrawing();
    ClearBackground(GetColor(GuiGetStyle(DEFAULT, BACKGROUND_COLOR)));

    if (GuiButton((Rectangle){24, 24, 120, 30}, "#191#Show Message"))
      showMessageBox = true;

    if (showMessageBox) {
      int result =
          GuiMessageBox((Rectangle){85, 70, 250, 100}, "#191#Message Box",
                        "Hi! This is a message!", "Nice;Cool");

      if (result >= 0)
        showMessageBox = false;
    }

    EndDrawing();
  }

  CloseWindow();
  return 0;
}
