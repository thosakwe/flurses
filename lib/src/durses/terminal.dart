import 'dart:math';

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

  /// Get the current location of the cursor.
  Point<int> get cursorLocation;

  /// Update the location of the cursor.
  set cursorLocation(Point<int> value);

  /// Updates the physical screen to be in sync with whatever
  /// reprsentation is in this class.
  void refresh();
}
