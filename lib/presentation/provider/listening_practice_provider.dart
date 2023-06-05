import 'package:flutter/cupertino.dart';
import 'package:phonation/core/entities/listening_practice.dart';

class ListeningPracticeProvider extends ChangeNotifier {
  late List<ListeningTask> _tasks;

  List<ListeningTask> get tasks => _tasks;

  set tasks(List<ListeningTask> value) {
    _tasks = value;
    notifyListeners();
  }

  bool _initialized = false;

  bool get initialized => _initialized;

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }
}
