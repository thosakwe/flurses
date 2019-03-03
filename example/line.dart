import 'package:flurses/flurses.dart';
import 'package:io/ansi.dart';

// Draws a thick, blue line.
main() => runApp(
      HorizontalLine(
        text: HorizontalLine.heavy,
        ansiCodes: [blue],
      ),
    );
