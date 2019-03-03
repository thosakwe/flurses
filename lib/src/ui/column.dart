import 'dart:math';
import 'package:flurses/flurses.dart';

// TODO: Main axis size, alignment, etc.
class Column extends RenderWidget {
  final Iterable<Widget> children;

  Column({@required this.children, Key key}) : super(key: key);

  @override
  Point<int> computeRenderSize(BuildContext context) {
    // TODO: implement computeRenderSize
    return null;
  }

  @override
  void build(BuildContext context) {
    
  }
}
