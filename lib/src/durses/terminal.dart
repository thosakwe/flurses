/// An abstraction over a terminal.
///
/// Coordinates are zero-based.
abstract class Terminal {
  /// The maximum height of the terminal.
  int get rows;

  /// The maximum width of the terminal.
  int get columns;

  /// Reads the character from position (x, y) on
  /// the screen.
  int readChar(int x, int y);

  /// Writes a character at (x, y).
  void writeChar(int x, int y, int char);
}
