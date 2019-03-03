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
    _snapshot = AsyncSnapshot().._connectionState = ConnectionState.none;
  }

  @override
  void initState() {
    super.initState();

    if (widget.future != null) {
      _snapshot._connectionState = ConnectionState.waiting;
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

class StreamBuilder<T> extends StatefulWidget {
  final Widget Function(BuildContext, AsyncSnapshot<List<T>>) builder;
  final Stream<T> stream;

  StreamBuilder({@required this.builder, this.stream});

  @override
  State<StatefulWidget> createState() => _StreamBuilderState<T>();
}

class _StreamBuilderState<T> extends State<StreamBuilder<T>> {
  AsyncSnapshot<List<T>> _snapshot;
  StreamSubscription<T> _sub;

  _StreamBuilderState() {
    _snapshot = AsyncSnapshot().._connectionState = ConnectionState.none;
  }

  @override
  void initState() {
    super.initState();

    if (widget.stream != null) {
      _snapshot._connectionState = ConnectionState.waiting;
      _sub = widget.stream.listen((obj) {
        _snapshot._data ??= [];
        _snapshot._connectionState = ConnectionState.active;
        setState(() => _snapshot._data.add(obj));
      }, onDone: () {
        setState(() => _snapshot._connectionState = ConnectionState.done);
      }, onError: (e) {
        _snapshot._error = e;
        setState(() => _snapshot._connectionState = ConnectionState.done);
      });
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    _sub?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _snapshot);
  }
}
