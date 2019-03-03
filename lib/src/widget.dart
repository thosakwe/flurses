import 'key.dart';

abstract class Widget {
  /// Used to "diff" the widget tree when drawing.
  ///
  /// If the previous widget has the same [runtimeType] and [key],
  /// then the old widget remains in tree, but its children are then diffed.
  ///
  /// Otherwise, the old widget is replaced entirely.
  Key get key;
}
