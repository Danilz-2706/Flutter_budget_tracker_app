import 'package:flutter/cupertino.dart';

class ThemeServices extends ChangeNotifier {
  bool _darkmode = true;

  bool get darkmode => _darkmode;

  set darkmode(bool value) {
    _darkmode = value;
    notifyListeners();
  }
}
