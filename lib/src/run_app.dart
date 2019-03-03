import 'dart:async';
import 'dart:io';
import 'renderer.dart';
import 'widget.dart';

Future runApp(Widget app, {IOSink sink}) {
  var renderer = Renderer();
  var onRebuild = StreamController();
  var context = BuildContext(
      sink ?? stdout, 0, 0, stdout.terminalColumns, stdout.terminalLines,
      onRebuild: onRebuild);
  var history = renderer.renderFresh(app, context);

  // This callback is only triggered once per build cycle.
  onRebuild.stream.listen((_) {
    print('Rebuild...');
  });

  return onRebuild.done;
}
