import 'dart:math';
import 'terminal.dart';

/// A [Terminal] implementation that handles a
/// bounded region of an [inner] [Terminal].
///
/// This is analagous to *windows* in `curses` and
/// `ncurses`.
class BoundedTerminal extends Terminal {
  /// The underlying [Terminal] implementation.
  final Terminal inner;

  /// The horizontal offset.
  final int xOffset;

  /// The vertical offset.
  final int yOffset;

  /// The maximum height of the terminal.
  final int maxRows;

  /// The maximum width of the terminal.
  final int maxColumns;

  BoundedTerminal(this.inner,
      {this.xOffset = 0, this.yOffset = 0, int maxRows, int maxColumns})
      : this.maxRows = maxRows ?? (inner.maxRows - yOffset),
        this.maxColumns = maxColumns ?? (inner.maxColumns - xOffset);

  @override
  int readChar(int x, int y) => inner.readChar(x + xOffset, y + yOffset);

  @override
  void writeChar(int x, int y, int char) =>
      inner.writeChar(x + xOffset, y + yOffset, char);

  @override
  void refresh() => inner.refresh();

  @override
  Point<int> get cursorLocation {
    var point = inner.cursorLocation;
    return Point(max(point.x - xOffset, 0), max(point.y - yOffset, 0));
  }

  @override
  set cursorLocation(Point<int> value) {
    inner.cursorLocation = Point(value.x + xOffset, value.y + yOffset);
  }

  @override
  void clearToEndOfLine() => inner.clearToEndOfLine();

  @override
  void clearToBeginningToLine() => inner.clearToBeginningToLine();

  @override
  void clearCurrentLine() => inner.clearCurrentLine();

  @override
  void clearToBottomOfScreen() => inner.clearToBottomOfScreen();

  @override
  void clearToTopOfScreen() => inner.clearToTopOfScreen();

  @override
  void clearEntireScreen() => inner.clearEntireScreen();

  @override
  int readKey() => inner.readKey();

  @override
  void reset() => inner.reset();

  @override
  set title(String title) => inner.title = title;

  @override
  void showCursor() => inner.showCursor();

  @override
  void hideCursor() => inner.hideCursor();
}
