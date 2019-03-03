import 'dart:math';
import 'package:flurses/flurses.dart';

main() => runApp(RandomApp());

class RandomApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RandomAppState();
}

class _RandomAppState extends State<RandomApp> {
  var rnd = Random();
  List<double> numbers;

  _RandomAppState() {
    numbers = List<double>.generate(3, (_) => rnd.nextDouble());
  }

  @override
  Widget build(BuildContext context) {
    var children = numbers.map((n) => Text(n.toString()));

    return Column(
      children: children.followedBy([Newline()]),
    );
  }
}
