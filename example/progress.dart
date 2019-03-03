import 'dart:async';
import 'package:flurses/flurses.dart';
import 'package:io/ansi.dart';

main() {
  runApp(
    StreamBuilder<int>(
      stream: countTo10(),
      builder: (context, snapshot) {
        var len = snapshot.hasData ? snapshot.data.length : 0;
        var value = len / 10;

        if (value == 1.0) {
          return Clear(
            child: Text('Done.\n'),
          );
        } else {
          return ProgressBar(
            text: ProgressBar.darkShade,
            value: value,
            ansiCodes: [magenta],
          );
        }
      },
    ),
  );
}

Stream<int> countTo10() async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(milliseconds: 250));
    yield i;
  }
}
