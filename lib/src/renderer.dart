import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:charcode/ascii.dart';
import 'package:meta/meta.dart';
import 'build_history.dart';
import 'key.dart';
import 'widget.dart';
part 'build_context.dart';
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
    if (widget is StatelessWidget) {
      var result = _ensureNotNull(widget.build(context), widget);
      var history = BuildHistory(widget);
      return history..child = renderFresh(result, context);
    } else if (widget is StatefulWidget) {
      var state = widget.createState()
        .._context = context
        .._widget = widget
        ..initState();
      var result = _ensureNotNull(state.build(context), state);
      var history = BuildHistory(widget, state: state);
      return history..child = renderFresh(result, context);
    } else if (widget is RenderWidget) {
      widget.build(context);
      return BuildHistory(widget);
    } else if (widget is MultiChildRenderWidget) {
      var renderChildren = <BuildHistory>[];
      var render = (Widget w, BuildContext context) {
        var history = renderFresh(w, context);
        renderChildren.add(history);
      };

      widget.build(context, render);
      return BuildHistory(widget)..children = renderChildren;
    } else {
      throw ArgumentError.value(
          widget, 'widget', 'Cannot render this type of Widget');
    }
  }

  BuildHistory renderUpdate(
      Widget widget, BuildHistory previous, BuildContext context) {
    // If the two widgets are "the same", then only render children.
    if (widget.runtimeType == previous.widget.runtimeType &&
        widget.key == previous.widget.key) {
      // If there is no child, then return the previous state.
      if (previous.child == null) {
        // return previous;
        return renderFresh(widget, context);
      } else if (previous.children != null) {
        // This is a MultiChildRenderWidget.
        // TODO: Handle updates
        return renderFresh(widget, context);
      } else {
        // Otherwise, return the previous state, BUT change the child
        // to the updated one.
        Widget child;

        if (widget is StatelessWidget)
          child = _ensureNotNull(widget.build(context), widget);
        else if (widget is StatefulWidget) {
          // Reuse the previous state object.
          var state = previous.state
            .._context = context
            .._widget = widget;
          child = _ensureNotNull(state.build(context), state);
        } else {
          // Theoretically, we'll never reach this point.
          throw ArgumentError.value(widget, 'widget',
              'This type of Widget cannot be updated as though it had a child.');
        }

        return previous..child = renderUpdate(child, previous.child, context);
      }
    } else {
      // Otherwise, replace the old widget entirely with the new widget.
      previous.state?.deactivate();
      return renderFresh(widget, context);
    }
  }
}
