import 'dart:math';
import 'dart:io' as io;
import 'package:charcode/ascii.dart';
import 'durses.dart';

/// A [Terminal] implementation that interacts with
/// the current process's [Stdin] and [Stdout].
class IoTerminal implements Terminal {
  final io.Stdin stdin;
  final io.Stdout stdout;
  int _x = 0, _y = 0;

  IoTerminal({io.Stdin stdin, io.Stdout stdout})
      : this.stdin = stdin ?? io.stdin,
        this.stdout = stdout = stdout ?? io.stdout;

  void _moveCursorTo(int x, int y) {
    if (_y == y) {
      if (x > _x) {
        var diff = x - _x;
        stdout.add([$esc, $lbracket, $0 + diff, $C]);
      } else if (x < _x) {
        var diff = _x - x;
        stdout.add([$esc, $lbracket, $0 + diff, $D]);
      }
      _x = x;
    } else {
      stdout.add([$esc, $lbracket, $0 + y, $semicolon, $0 + x, $H]);
      _y = y;
      _x = x;
    }
  }

  @override
  int get maxRows => stdout.terminalLines;

  @override
  int get maxColumns => stdout.terminalColumns;

  @override
  void refresh() => null;

  @override
  int readChar(int x, int y) {
    _moveCursorTo(x, y);
    // TODO: Get char
  }

  @override
  void writeChar(int x, int y, int char) {
    _moveCursorTo(x, y);
    stdout.writeCharCode(char);
  }

  @override
  Point<int> get cursorLocation {
    // TODO: Implement this
  }

  @override
  set cursorLocation(Point<int> value) {
    _moveCursorTo(value.x, value.y);
  }
}
