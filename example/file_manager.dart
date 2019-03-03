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
        HorizontalLine(
          text: HorizontalLine.heavy,
          ansiCodes: [
            backgroundCyan,
          ],
        ),
      ],
    );
  }
}
