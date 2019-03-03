import 'dart:io';
import 'package:flurses/flurses.dart';
import 'package:io/ansi.dart';

main() => runApp(FileApp());

class FileApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FileAppState();
}

class _FileAppState extends State<FileApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Title(),
        Clear(),
      ],
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HorizontalLine(
          text: ' ',
          ansiCodes: [
            backgroundCyan,
          ],
        ),
        Text(
          'Flurses file manager',
          ansiCodes: [backgroundCyan, white],
        ),
      ],
    );
  }
}
