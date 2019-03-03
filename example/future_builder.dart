import 'dart:async';
import 'dart:io';
import 'package:flurses/flurses.dart';

main() => runApp(DartSizeApp());

class DartSizeApp extends StatelessWidget {
  Future<int> getDartSize() async {
    var file = File(Platform.resolvedExecutable);
    await Future.delayed(Duration(seconds: 3));
    return await file.length();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: getDartSize(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading...');
        } else {
          var size = snapshot.data;
          return Text('Size of Dart: $size byte(s)');
        }
      },
    );
  }
}
