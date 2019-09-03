import 'dart:async';
import 'package:flurses/durses.dart';
import 'package:flurses/flurses.dart';

class Runner {
  final Terminal terminal;
  final Widget app;
  StreamSubscription _onSigWinch;

  Runner(this.terminal, this.app, {Stream onSigWinch}) {
    _onSigWinch = onSigWinch?.listen(_handleResize);
  }

  void _handleResize(_) {
    // TODO: Handle resize
  }

  void close() {
    _onSigWinch.cancel();
  }
}
