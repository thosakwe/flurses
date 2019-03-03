import 'dart:async';
import 'dart:io';
import 'package:flurses/flurses.dart';

main() => runApp(StdinApp());

class StdinApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StdinAppState();
}

class _StdinAppState extends State<StdinApp> {
  var buf = StringBuffer();
  StreamSubscription<int> _sub;

  @override
  void initState() {
    super.initState();
    stdin
      ..echoMode = false
      ..lineMode = false;
    _sub = stdin.expand((l) => l).listen((ch) {
      setState(() => buf.writeCharCode(ch));
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    _sub?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // return HorizontalLine();
    return Column(
      children: [
        HorizontalLine(),
        Text('Write some text: $buf'),
        HorizontalLine(),
      ],
    );
  }
}
