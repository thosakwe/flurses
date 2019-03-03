part of 'renderer.dart';

class BuildContext {
  final IOSink sink;
  final int y, x;
  final int maxX, maxY;

  final StreamController _onRebuild;
  bool _hasMarkedRebuild = false;

  BuildContext(this.sink, this.x, this.y, this.maxX, this.maxY,
      {StreamController onRebuild})
      : _onRebuild = onRebuild;

  void clearScreen() {
    // Esc[2J
    sink.add([$esc, $lbracket, $2, $J]);
  }

  void _triggerRebuild() {
    if (!_hasMarkedRebuild) {
      _hasMarkedRebuild = true;
      _onRebuild?.add(null);
    }
  }
}
