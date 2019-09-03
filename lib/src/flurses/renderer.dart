import 'package:flurses/durses.dart';
import 'package:flurses/flurses.dart';

class Renderer {
  final Terminal terminal;
  final Widget app;

  Renderer(this.terminal, this.app);

  RenderTree visitRenderObject(
      BuildContext context, RenderObjectWidget widget) {}

  RenderTree visitMultiChildRenderObject(
      BuildContext context, MultiChildRenderObjectWidget widget) {}

  RenderTree visitStateless(BuildContext context, StatelessWidget widget) {}

  RenderTree visitStateful(BuildContext context, StatefulWidget widget) {}
}
