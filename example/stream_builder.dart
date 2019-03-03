import 'dart:io';
import 'package:flurses/flurses.dart';

main() => runApp(KeysApp());

class KeysApp extends StatelessWidget {
  KeysApp() {
    stdin
      ..echoMode = false
      ..lineMode = false;
  }

  @override
  Widget build(BuildContext context) {
    var keys = stdin.expand((l) => l);
    return StreamBuilder<int>(
      stream: keys,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          context.clearScreen();
          return Text('Whoops! An error occurred.');
        } else if (!snapshot.hasData) {
          return Text('Start typing. Each key you type will appear here.');
        } else {
          var buf = StringBuffer();
          snapshot.data.forEach(buf.writeCharCode);
          return Text(buf.toString());
        }
      },
    );
  }
}
