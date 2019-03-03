import 'dart:async';
import 'package:flurses/flurses.dart';

main() => runApp(ClockApp());

class ClockApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClockAppState();
}

class _ClockAppState extends State<ClockApp> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        // In a real app, we'd do something.
        // For the purposes of this example, we just setState()
        // To trigger a rebuild.
      });
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    return Text('The time is: $now');
  }
}
