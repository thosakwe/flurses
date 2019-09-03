import 'dart:math';
import 'package:flurses/durses.dart';
import 'widget.dart';

class RenderResult {
  final BuildContext context;
  final Rectangle<int> area;

  RenderResult(this.context, this.area);
}

class BuildContext {
  final Terminal terminal;
  final int maxRows;
  final int maxColumns;
  final BuildContext parent;
  final Widget widget;

  BuildContext(
      this.terminal, this.maxRows, this.maxColumns, this.parent, this.widget);

  BuildContext change(
      {Terminal terminal,
      int maxRows,
      int maxColumns,
      BuildContext parent,
      Widget widget}) {
    return BuildContext(
        terminal ?? this.terminal,
        maxRows ?? this.maxRows,
        maxColumns ?? this.maxColumns,
        parent ?? this.parent,
        widget ?? this.widget);
  }
}
