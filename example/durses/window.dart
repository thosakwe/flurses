import 'package:flurses/durses.dart';
import 'package:flurses/durses_io.dart';

main() {
  var io = IoTerminal();
  return io.run(() async {
    var wnd = BoundedTerminal(io, yOffset: 2);
    wnd.writeString(0, 0, "This is line 2");
  });
}
