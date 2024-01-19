import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'dart:async';

abstract class NetworkInfo {
  void initializeNetworkStream();
  StreamSubscription<bool> get listenToNetworkStream;
  Future<bool> get isConnected;
  Future<void> dispose();
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfoImpl({required this.internetConnectionChecker});

  final StreamController<bool> _streamController = StreamController<bool>();
  late final StreamSubscription<bool> _streamSubscription =
      _streamController.stream.asBroadcastStream().listen((event) => event);
  late StreamSubscription<InternetConnectionStatus> _internetConnectionStream;
  @override
  Future<bool> get isConnected async =>
      await internetConnectionChecker.hasConnection;
  @override
  void initializeNetworkStream() {
    _internetConnectionStream =
        internetConnectionChecker.onStatusChange.listen((event) {
      if (event == InternetConnectionStatus.connected) {
        _streamController.sink.add(true);
      } else {
        _streamController.sink.add(false);
      }
    });
  }

  @override
  StreamSubscription<bool> get listenToNetworkStream {
    if (_streamSubscription.isPaused) {
      _streamSubscription.resume();
    }
    return _streamSubscription;
  }

  @override
  Future<void> dispose() async {
    await _streamController.close();
    await _internetConnectionStream.cancel();
  }
}
