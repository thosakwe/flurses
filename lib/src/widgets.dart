import 'build_context.dart';
import 'widget.dart';

abstract class StatelessWidget implements Widget {
  const StatelessWidget();

  Widget build(BuildContext context);
}

abstract class StatefulWidget extends Widget {
  State createState();
}

abstract class State<T extends StatefulWidget> {
  Widget build(BuildContext context);
}
