import 'build_context.dart';
import 'renderer.dart';
import 'render_tree.dart';

abstract class Widget {
  const Widget();

  RenderTree accept(Renderer renderer, BuildContext context);
}
