import 'dart:math';
import 'package:flurses/flurses.dart';

abstract class RenderObjectWidget extends Widget {
  const RenderObjectWidget();

  Rectangle<int> computeBounds(BuildContext context);

  void render(BuildContext context, Rectangle<int> computedBounds);

  @override
  RenderTree accept(Renderer renderer, BuildContext context) =>
      renderer.visitRenderObject(context, this);
}
