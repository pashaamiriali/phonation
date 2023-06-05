import 'package:flutter/material.dart';
import 'package:phonation/core/entities/level.dart';

class HomeProvider extends ChangeNotifier {
  List<Level> _levels = [];

  List<Level> get levels => _levels;

  void updateLevels(List<Level> levels) {
    _levels = levels;
    notifyListeners();
  }

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
