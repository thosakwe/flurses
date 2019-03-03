import 'dart:io';
import 'package:flurses/flurses.dart';
import 'package:io/ansi.dart';

main() async {
  runApp(
    Builder(
      builder: (context) {
        context.hideCursor();
        return Stack(
          children: [
            Clear(
              ansiCodes: [backgroundRed],
              child: Text(
                '..............\nHit any key to exit.',
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
        );
      },
    ),
  );
  stdin.lineMode = stdin.echoMode = false;
  await stdin.expand((l) => l).first;
}
