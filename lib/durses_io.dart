import 'dart:async';
import 'dart:math';
import 'dart:io' as io;
import 'dart:typed_data';
import 'package:charcode/ascii.dart';
import 'durses.dart';

/// A [Terminal] implementation that interacts with
/// the current process's [Stdin] and [Stdout].
class IoTerminal extends Terminal {
  final io.Stdin stdin;
  final io.Stdout stdout;
  Uint8List _charBuf;
  int _x = 0, _y = 0;
  // TODO: Handle SIGWINCH
  int _maxRows, _maxColumns;

  IoTerminal({io.Stdin stdin, io.Stdout stdout})
      : this.stdin = stdin ?? io.stdin,
        this.stdout = stdout = stdout ?? io.stdout;

  /// Runs [f], and restores the previous `lineMode` and `echoMode`
  /// of [stdin].
  Future<T> run<T>(FutureOr<T> Function() f,
      {bool lineMode = false, bool echoMode = false}) {
    var oldLineMode = stdin.lineMode;
    var oldEchoMode = stdin.echoMode;
    return Future(() async {
      stdin.echoMode = echoMode;
      stdin.lineMode = lineMode;
      return await f();
    }).whenComplete(() {
      stdin.lineMode = oldLineMode;
      stdin.echoMode = oldEchoMode;
    });
  }

  int _charIndex(int x, int y) {
    return (y * maxColumns) + x;
  }

  void _initCharBuffer() {
    _charBuf ??= Uint8List(maxRows * maxColumns);
  }

  void _moveCursorTo(int x, int y) {
    if (_y == y) {
      if (x > _x + 1) {
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
  int get maxRows => _maxRows ??= stdout.terminalLines;

  @override
  int get maxColumns => _maxColumns ??= stdout.terminalColumns;

  @override
  void refresh() => null;

  @override
  int readChar(int x, int y) {
    _initCharBuffer();
    return _charBuf[_charIndex(x, y)];
  }

  @override
  void writeChar(int x, int y, int char) {
    _moveCursorTo(x, y);
    stdout.writeCharCode(char);
    _initCharBuffer();
    _charBuf[_charIndex(x, y)] = char;
  }

  @override
  Point<int> get cursorLocation {
    // Write ESC[6n - the terminal then writes ESC[n;mR
    stdout.add([$esc, $lbracket, $6, $n]);
    // TODO: Find a way to fail gracefully if invalid input is returned.
    stdin..readByteSync()..readByteSync();
    var nBuf = StringBuffer(), mBuf = StringBuffer();
    var ch = stdin.readByteSync();
    while (ch != $semicolon) {
      nBuf.writeCharCode(ch);
      ch = stdin.readByteSync();
    }
    while (ch != $R) {
      mBuf.writeCharCode(ch);
      ch = stdin.readByteSync();
    }
    // Parse the location.
    return Point(int.parse(mBuf.toString()), int.parse(nBuf.toString()));
  }

  @override
  set cursorLocation(Point<int> value) {
    _moveCursorTo(value.x, value.y);
  }
}
