import 'package:flurses/flurses.dart';
import 'package:meta/meta.dart';

abstract class StatefulWidget extends Widget {
  State createState();

  @override
  RenderTree accept(Renderer renderer, BuildContext context) =>
      renderer.visitStateful(context, this);
}

abstract class State<T extends StatefulWidget> {
  @mustCallSuper
  void initState() => null;

  @mustCallSuper
  void deactivate() => null;

  void setState(void Function() f);

  Widget build(BuildContext context);
}
