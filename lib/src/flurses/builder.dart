import 'package:meta/meta.dart';
import 'build_context.dart';
import 'stateless_widget.dart';
import 'widget.dart';

class Builder extends StatelessWidget {
  final Widget Function(BuildContext) builder;

  Builder({@required this.builder});

  @override
  Widget build(BuildContext context) => builder(context);
}
