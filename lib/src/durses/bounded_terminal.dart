import 'terminal.dart';

class BoundedTerminal extends Terminal {
  final Terminal inner;
  final int xOffset;
  final int yOffset;
  final int maxRows;
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
