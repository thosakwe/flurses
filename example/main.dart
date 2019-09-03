import 'package:flurses/flurses.dart';
import 'package:flurses/flurses_io.dart';

main() {
  // TODO: Remove the need to disable resetting
  runApp(HelloApp(), resetAfterExit: false);
}

class HelloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Replace with centered text
    return Text('Hello, flurses!');
  }
}
