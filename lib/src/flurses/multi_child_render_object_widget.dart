import 'dart:math';
import 'package:flurses/flurses.dart';
import 'package:tuple/tuple.dart';

abstract class MultiChildRenderObjectWidget extends Widget {
  const MultiChildRenderObjectWidget();

  List<Tuple2<BuildContext, Rectangle<int>>> computeChildBounds(
      BuildContext context);

  void render(BuildContext context,
      List<Tuple2<BuildContext, Rectangle<int>>> computedChildBounds);

  @override
  RenderTree accept(Renderer renderer, BuildContext context) =>
      renderer.visitMultiChildRenderObject(context, this);
}
