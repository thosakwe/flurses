import 'package:flurses/flurses.dart';
import 'package:meta/meta.dart';
import 'build_context.dart';
import 'widget.dart';

@immutable
abstract class StatelessWidget extends Widget {
  const StatelessWidget();

  Widget build(BuildContext context);

  @override
  RenderTree accept(Renderer renderer, BuildContext context) =>
      renderer.visitStateless(context, this);
}
