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
        var text = 'Value=$value';
        if (value == 1.0) text = 'Done.........';
        return Column(
          children: [
            Text(text),
            ProgressBar(
              text: ProgressBar.darkShade,
              value: value,
              ansiCodes: [green],
            ),
          ],
        );
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
