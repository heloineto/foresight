import 'package:flutter/material.dart';

class LocalAuthService extends ChangeNotifier {
  bool _locallyAuthenticated = false;

  bool get locallyAuthenticated => _locallyAuthenticated;

  set locallyAuthenticated(bool locallyAuthenticated) {
    _locallyAuthenticated = locallyAuthenticated;
    notifyListeners();
  }
}
