import 'package:flutter/material.dart';
import 'package:phonation/core/entities/lesson.dart';

class LessonProvider extends ChangeNotifier {
  List<Lesson> _lessons = [];

  List<Lesson> get lessons => _lessons;

  updateLessons(List<Lesson> value) {
    _lessons = value;
    notifyListeners();
  }
  bool _isLoading=true;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
