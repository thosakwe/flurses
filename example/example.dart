import 'package:flurses/flurses.dart';

void main() {
  runApp(_HelloApp());
}

class _HelloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello, flurses!');
  }
}
