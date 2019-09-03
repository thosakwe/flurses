import 'package:flurses/flurses.dart';

abstract class RenderTree {}

class SingleRenderTree extends RenderTree {
  Widget widget;
  BuildContext context;
  RenderTree child;
  SingleRenderTree(this.widget, this.context, {this.child});
}
