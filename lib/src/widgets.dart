part of 'renderer.dart';

abstract class StatelessWidget implements Widget {
  final Key key;

  const StatelessWidget({this.key});

  Widget build(BuildContext context);
}

abstract class StatefulWidget extends Widget {
  State createState();
}

abstract class State<T extends StatefulWidget> {
  T _widget;

  T get widget => _widget;

  Widget build(BuildContext context);
}
