part of 'renderer.dart';

abstract class RenderWidget implements Widget {
  final Key key;

  const RenderWidget({this.key});

  Point<int> computeRenderSize(BuildContext context);

  void build(BuildContext context);

  void destroy(BuildContext context);
}

abstract class MultiChildRenderWidget implements Widget {
  final Key key;
  final List<Widget> children;

  const MultiChildRenderWidget({this.key, this.children});

  Point<int> computeRenderSize(BuildContext context);

  void build(BuildContext context, void Function(Widget, BuildContext) render);

  void destroy(BuildContext context);
}

abstract class StatelessWidget implements Widget {
  final Key key;

  const StatelessWidget({this.key});

  Widget build(BuildContext context);
}

@immutable
abstract class StatefulWidget extends Widget {
  final Key key;

  StatefulWidget({this.key});

  State createState();
}

abstract class State<T extends StatefulWidget> {
  BuildContext _context;
  T _widget;

  BuildContext get context => _context;

  T get widget => _widget;

  Widget build(BuildContext context);

  void initState() {}

  void deactivate() {}

  void setState(void Function() f) {
    f();
    context._triggerRebuild();
  }
}
