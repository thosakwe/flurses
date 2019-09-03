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
}
