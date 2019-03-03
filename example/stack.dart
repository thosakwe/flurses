import 'dart:io';
import 'package:flurses/flurses.dart';
import 'package:io/ansi.dart';

main() {
  runApp(
    Stack(
      children: [
        Clear(
          ansiCodes: [backgroundRed],
          child: Text(
            '..............',
            ansiCodes: [backgroundRed, white],
          ),
        ),
        Text(
          '!!',
          ansiCodes: [
            backgroundGreen,
            white,
          ],
        ),
      ],
    ),
  );
  stdin.listen(null);
}
