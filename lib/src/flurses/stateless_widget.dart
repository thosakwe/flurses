import 'package:meta/meta.dart';
import 'build_context.dart';
import 'widget.dart';

@immutable
abstract class StatelessWidget extends Widget {
  const StatelessWidget();

  Widget build(BuildContext context);
}
