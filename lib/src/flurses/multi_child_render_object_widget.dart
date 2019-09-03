import 'dart:math';
import 'package:tuple/tuple.dart';
import 'build_context.dart';
import 'widget.dart';

abstract class MultiRenderObjectWidget extends Widget {
  const MultiRenderObjectWidget();

  List<Tuple2<BuildContext, Rectangle<int>>> computeChildBounds(
      BuildContext context);

  void render(BuildContext context,
      List<Tuple2<BuildContext, Rectangle<int>>> computedChildBounds);
}
