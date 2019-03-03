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
