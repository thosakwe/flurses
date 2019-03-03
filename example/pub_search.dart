import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flurses/flurses.dart';
import 'package:http/http.dart' as http;
import 'package:io/io.dart';

main() => runApp(PubSearchApp());

class PubSearchApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PubSearchAppState();
}

enum PubSearchState { enteringText, loading, found, errored }

class _PubSearchAppState extends State<PubSearchApp> {
  var query = StringBuffer();
  var state = PubSearchState.enteringText;
  var client = http.Client();
  String latestVersion;
  StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    stdin
      ..echoMode = false
      ..lineMode = false;

    // Listen for user input.
    _sub = sharedStdIn.expand((l) => l).listen((ch) {
      if (ch != 0xA) {
        // If the key is not ENTER, then append to the query, and re-render.
        setState(() => query.writeCharCode(ch));
      } else {
        // When the user hits enter, clear the screen, and start searching.
        _sub.cancel();
        context.clearScreen();
        setState(() => state = PubSearchState.loading);

        // Query Pub's API...
        // https://pub.dartlang.org/api/packages/$query
        var url = Uri(
            scheme: 'https',
            host: 'pub.dartlang.org',
            pathSegments: ['api', 'packages', query.toString()]);
        client.get(url).then((response) {
          // If the response is a 404, trigger an error state.
          if (response.statusCode == 404) {
            throw 'not-found';
          } else {
            // Otherwise, re-render.
            var contents = json.decode(response.body) as Map;
            var latest = contents['latest'] as Map;
            context.clearScreen();
            setState(() {
              state = PubSearchState.found;
              latestVersion = latest['version'] as String;
            });
          }
        }).catchError((e) {
          // When an error occurs, re-render.
          context.clearScreen();
          setState(() => state = PubSearchState.errored);
        });
      }
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    client.close();
    _sub?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case PubSearchState.enteringText:
        return Text('Enter a search term: $query');
      case PubSearchState.loading:
        return Text('Searching Pub...');
      case PubSearchState.errored:
        return Text('Could not find any package named "$query".');
      default:
        return Text(
            'The latest version of `package:$query` is $latestVersion.');
    }
  }
}
