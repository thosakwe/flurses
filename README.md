# flurses
Flutter for the terminal.

![screenshot](screenshot.png)

WIP. For now, feel free to toy around with the examples.

Mostly just an educational/for-fun project.

Several widgets have been ported from Flutter. The end goal is to be able
to use `flurses` for basically any application you would use `curses` for.

**Important missing features:**
* Needs a double buffer to prevent jank
* Destroyed widgets can potentially leave "phantom text" on the screen
* No `InheritedWidget` support
* `MultiChildRenderWidget` current always renders *fresh*, without any diffing.
* No theming support
* No keyboard support - you must manually listen to `stdin`