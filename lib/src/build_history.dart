import 'renderer.dart';
import 'widget.dart';

class BuildHistory {
  final Widget widget;
  final State state;
  BuildHistory child;
  List<BuildHistory> children;

  BuildHistory(this.widget, {this.state});
}
