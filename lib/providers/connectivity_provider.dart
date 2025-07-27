import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider extends ChangeNotifier {
  bool _isOnline = true;

  bool get isOnline => _isOnline;

  ConnectivityProvider() {
    initConnectivity();
    Connectivity().onConnectivityChanged.listen(updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    try {
      final results = await Connectivity().checkConnectivity();
      _isOnline = hasConnection(results);
      notifyListeners();
    } catch (e) {
      _isOnline = false;
      notifyListeners();
    }
  }

  void updateConnectionStatus(List<ConnectivityResult> results) {
    final connected = hasConnection(results);
    if (connected != _isOnline) {
      _isOnline = connected;
      notifyListeners();
    }
  }

  bool hasConnection(List<ConnectivityResult> results) {
    return results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.ethernet);
  }
}
