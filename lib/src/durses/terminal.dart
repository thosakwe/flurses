/// An abstraction over a terminal.
///
/// Coordinates are zero-based.
abstract class Terminal {
  /// The maximum height of the terminal.
  int get maxRows;

  /// The maximum width of the terminal.
  int get maxColumns;

  /// Reads the character from position (x, y) on
  /// the screen.
  int readChar(int x, int y);

  /// Writes a character at (x, y).
  void writeChar(int x, int y, int char);

  /// Updates the physical screen to be in sync with whatever
  /// reprsentation is in this class.
  void refresh();
}
