import 'package:flurses/flurses.dart';

class Renderer {
  RenderTree visitRenderObject(
      BuildContext context, RenderObjectWidget widget) {
    var bounds = widget.computeBounds(context);
    widget.render(context, bounds);
    return SingleRenderTree(widget, context);
  }

  RenderTree visitMultiChildRenderObject(
      BuildContext context, MultiChildRenderObjectWidget widget) {}

  RenderTree visitStateless(BuildContext context, StatelessWidget widget) {
    var childContext = context.change(parent: context);
    var child = widget.build(context);
    // TODO: Handle null in build()?
    return SingleRenderTree(widget, context,
        child: child.accept(this, childContext));
  }

  RenderTree visitStateful(BuildContext context, StatefulWidget widget) {}
}
