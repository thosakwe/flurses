import 'package:flurses/flurses.dart';
import 'package:io/ansi.dart';

main() {
  runApp(
    SizedBox(
      width: 10,
      height: 3,
      child: Clear(ansiCodes: [backgroundBlue]),
    ),
  );
}
