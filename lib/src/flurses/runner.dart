import 'dart:async';
import 'package:flurses/durses.dart';
import 'package:flurses/flurses.dart';

class Runner {
  // TODO: Wrap in a BufferedTerminal
  final Terminal terminal;
  final Widget app;
  RenderTree _lastTree;
  Renderer _renderer = Renderer();
  StreamSubscription _onResize;

  Runner(this.terminal, this.app, {Stream onResize}) {
    _onResize = onResize?.listen(_handleResize);
  }

  void _handleResize(_) {
    // TODO: Handle resize
  }

  RenderTree redraw() {
    var context = BuildContext(
        terminal, terminal.maxRows, terminal.maxColumns, null, app);
    return _lastTree = app.accept(_renderer, context);
  }

  Future<void> run() {
    // TODO:
    return Future(() async {
      redraw();
    }).whenComplete(close);
  }

  void close() {
    _onResize.cancel();
  }
}
