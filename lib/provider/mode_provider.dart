import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModeProvider with ChangeNotifier {
  bool _lightModeEnable = true;

  //  getter
  bool get lightModeEnable => _lightModeEnable;

  //  setter
  set lightModeEnable(bool value) {
    _lightModeEnable = value;
  }

  //  change the mode by button and save it
  chaneMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _lightModeEnable ? _lightModeEnable = false : _lightModeEnable = true;
    prefs.setBool("_lightModeEnable", _lightModeEnable);
    notifyListeners();
  }

  //  get the last mode the user set it
  getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    lightModeEnable = prefs.getBool("_lightModeEnable") ?? true;
    notifyListeners();
  }
}
