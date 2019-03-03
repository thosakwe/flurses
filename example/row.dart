import 'package:flurses/flurses.dart';
import 'package:io/ansi.dart';

main() {
  runApp(Row(
    children: [
      Text('red ', ansiCodes: [red]),
      Text('blue\n', ansiCodes: [blue]),
    ],
  ));
}
