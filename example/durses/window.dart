import 'package:flurses/durses.dart';
import 'package:flurses/durses_io.dart';

/// Analogous to "windows" in `curses` are `BoundedTerminal`
/// instances.
///
/// They draw at an offset within a parent terminal.
main() {
  var io = IoTerminal();
  return io.run(() async {
    var wnd = BoundedTerminal(io, yOffset: 2, xOffset: 3);
    wnd.writeString(0, 0, "This is actually line 2, col 3, not (0, 0).");
    wnd.writeString(0, 1, "Press any key to exit.");
    wnd.readKey();
  });
}
