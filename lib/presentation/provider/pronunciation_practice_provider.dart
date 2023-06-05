import 'package:flutter/cupertino.dart';
import 'package:phonation/core/entities/pronunciation_practice.dart';

class PronunciationPracticeProvider extends ChangeNotifier {
  late List<PronunciationPractice> _practices;
  bool isLoading = true;

  set practices(List<PronunciationPractice> practices) {
    _practices = practices;
    notifyListeners();
    initialized = true;
  }

  bool initialized = false;
  int _currentPracticeIndex = 0;

  PronunciationPractice getCurrentPractice() {
    return _practices[_currentPracticeIndex];
  }

  //returns true when the practices are done
  bool markDone() {
    if (_practices.length > _currentPracticeIndex) {
      _currentPracticeIndex++;
      notifyListeners();
      return false;
    } else {
      return true;
    }
  }
}
