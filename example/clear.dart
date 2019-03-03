import 'package:flurses/flurses.dart';
import 'package:io/ansi.dart';

main() {
  runApp(
    Clear(
      ansiCodes: [backgroundRed],
      child: Text(
        'Hello, red world!',
        ansiCodes: [backgroundRed, white],
      ),
    ),
  );
}
