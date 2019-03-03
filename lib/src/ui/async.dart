import 'dart:async';
import 'package:flurses/flurses.dart';

enum ConnectionState { active, none, waiting, done }

class AsyncSnapshot<T> {
  ConnectionState _connectionState = ConnectionState.none;
  T _data;
  Object _error;

  ConnectionState get connectionState => _connectionState;

  T get data => _data;

  Object get error => _error;

  bool get hasData => _data != null;

  bool get hasError => _error != null;
}

class FutureBuilder<T> extends StatefulWidget {
  final Widget Function(BuildContext, AsyncSnapshot<T>) builder;
  final Future<T> future;

  FutureBuilder({@required this.builder, this.future, Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _FutureBuilderState<T>();
}

class _FutureBuilderState<T> extends State<FutureBuilder<T>> {
  AsyncSnapshot<T> _snapshot;

  _FutureBuilderState() {
    _snapshot = AsyncSnapshot().._connectionState = ConnectionState.waiting;
  }

  @override
  void initState() {
    super.initState();

    if (widget.future != null) {
      widget.future.then((result) {
        _snapshot._data = result;
      }).catchError((e) {
        _snapshot._error = e;
      }).whenComplete(() {
        setState(() => _snapshot._connectionState = ConnectionState.done);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _snapshot);
  }
}

// class StreamBuilder<T> extends StatefulWidget {
//   final Stream<T> stream;
// }
