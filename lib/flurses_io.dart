import 'dart:async';
import 'dart:io';
import 'package:flurses/durses_io.dart';
import 'package:flurses/flurses.dart';

// TODO: Docs
Future<void> runApp(Widget app,
    {Stdin stdin,
    Stdout stdout,
    bool listenForResize = true,
    bool lineMode = false,
    bool echoMode = false,
    bool clear = true,
    bool resetAfterExit = true}) async {
  var terminal = IoTerminal(stdin: stdin, stdout: stdout);
  return terminal.run(() {
    var runner = Runner(
      terminal,
      app,
      onResize: listenForResize ? ProcessSignal.sigwinch.watch() : null,
    );
    return runner.run();
  },
      lineMode: lineMode,
      echoMode: echoMode,
      clear: clear,
      resetAfterExit: resetAfterExit);
}
