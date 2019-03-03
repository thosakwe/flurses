import 'build_context.dart';
import 'build_history.dart';
import 'key.dart';
import 'widget.dart';
part 'widgets.dart';

class Renderer {
  Widget _ensureNotNull(Widget widget, source) {
    if (widget != null) {
      return widget;
    } else {
      throw StateError('Rendering $source returned null.');
    }
  }

  BuildHistory renderFresh(Widget widget, BuildContext context) {
    // TODO: Self-drawing widgets
    if (widget is StatelessWidget) {
      var result = _ensureNotNull(widget.build(context), widget);
      var history = BuildHistory(widget);
      return history..child = renderFresh(result, context);
    } else if (widget is StatefulWidget) {
      var state = widget.createState().._widget = widget;
      var result = _ensureNotNull(state.build(context), state);
      var history = BuildHistory(widget, state: state);
      return history..child = renderFresh(result, context);
    } else {
      throw ArgumentError.value(
          widget, 'widget', 'Cannot render this type of Widget');
    }
  }
}
