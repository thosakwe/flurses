import 'dart:async';
import 'dart:io';
import 'package:flurses/durses_io.dart';
import 'package:flurses/flurses.dart';

Future<void> runApp(Widget app,
    {Stdin stdin, Stdout stdout, bool listenForResize = true}) async {
  var terminal = IoTerminal(stdin: stdin, stdout: stdout);
  var runner = Runner(
    terminal,
    app,
    onResize: listenForResize ? ProcessSignal.sigwinch.watch() : null,
  );
  return runner.run();
}
