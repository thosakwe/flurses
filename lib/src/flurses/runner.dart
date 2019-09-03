import 'dart:async';
import 'package:flurses/durses.dart';
import 'package:flurses/flurses.dart';

class Runner {
  // TODO: Wrap in a BufferedTerminal
  final Terminal terminal;
  final Widget app;
  StreamSubscription _onResize;

  Runner(this.terminal, this.app, {Stream onResize}) {
    _onResize = onResize?.listen(_handleResize);
  }

  void _handleResize(_) {
    // TODO: Handle resize
  }

  Future<void> run() {
    // TODO:
    return Future(() async {}).whenComplete(close);
  }

  void close() {
    _onResize.cancel();
  }
}
