import 'package:flurses/durses.dart';
import 'package:flurses/durses_io.dart';

main() {
  var io = IoTerminal();
  return io.run(() async {
    var wnd = BoundedTerminal(io, yOffset: 2);
    wnd.writeString(0, 0, "This is actually line 2, not 0.");
    wnd.writeString(0, 1, "Press any key to exit.");
    wnd.readKey();
  });
}
