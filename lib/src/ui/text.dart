import 'package:flurses/flurses.dart';

class Text extends RenderWidget {
  final String text;

  const Text(this.text, {Key key}) : super(key: key);

  @override
  void build(BuildContext context) {
    // TODO: print at point
    context.sink.write(text);
  }
}
