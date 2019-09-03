import 'package:meta/meta.dart';
import 'build_context.dart';
import 'widget.dart';

abstract class StatefulWidget extends Widget {
  State createState();
}

abstract class State<T extends StatefulWidget> {
  @mustCallSuper
  void initState() => null;

  @mustCallSuper
  void deactivate() => null;

  void setState(void Function() f);

  Widget build(BuildContext context);
}
