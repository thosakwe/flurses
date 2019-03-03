import 'build_context.dart';
import 'renderer.dart';
import 'widget.dart';

void runApp(Widget app) {
  var context = BuildContext();
  var renderer = Renderer();
  var history = renderer.renderFresh(app, context);
}
