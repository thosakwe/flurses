import 'dart:math';
import 'build_context.dart';
import 'widget.dart';

abstract class RenderObjectWidget extends Widget {
  const RenderObjectWidget();

  Rectangle<int> computeBounds(BuildContext context);

  void render(BuildContext context, Rectangle<int> computedBounds);
}
