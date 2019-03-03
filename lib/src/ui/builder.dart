import 'package:flurses/flurses.dart';

class Builder extends StatelessWidget {
  final Widget Function(BuildContext) builder;

  Builder({@required this.builder, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => builder(context);
}
