import 'package:flurses/flurses.dart';
import 'package:meta/meta.dart';

class Builder extends StatelessWidget {
  final Widget Function(BuildContext) builder;

  Builder({@required this.builder});

  @override
  Widget build(BuildContext context) => builder(context);
}
