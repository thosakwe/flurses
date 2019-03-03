import 'dart:io';
import 'build_context.dart';
import 'renderer.dart';
import 'widget.dart';

void runApp(Widget app, {IOSink sink}) {
  var context = BuildContext(
      sink ?? stdout, 0, 0, stdout.terminalColumns, stdout.terminalLines);
  var renderer = Renderer();
  var history = renderer.renderFresh(app, context);
}
