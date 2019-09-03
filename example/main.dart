import 'package:flurses/flurses.dart';
import 'package:flurses/flurses_io.dart';

main() {
  runApp(HelloApp());
}

class HelloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Replace with centered text
    return Text('Hello, flurses!');
  }
}
