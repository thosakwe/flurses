part of 'renderer.dart';

class BuildContext {
  final IOSink sink;
  final int y, x;
  final int maxX, maxY;

  BuildContext(this.sink, this.x, this.y, this.maxX, this.maxY);
}
