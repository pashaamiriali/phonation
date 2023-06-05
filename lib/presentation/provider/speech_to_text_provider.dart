import 'package:flutter/cupertino.dart';
import 'package:picovoice_flutter/picovoice_manager.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextProvider extends ChangeNotifier {
  late stt.SpeechToText _stt;
  bool available = false;
  bool isLoading = false;

  bool listening=false;

  Future init() async {
    print('initializing stt');
    isLoading = true;
    notifyListeners();
    _stt = stt.SpeechToText();
    available = await _stt.initialize(debugLogging: true,
        onStatus: _statusListener, onError: _errorListener);
    isLoading = false;
    notifyListeners();
  }

  _statusListener(String status) {
    print(status);
  }

  _errorListener(SpeechRecognitionError error) {
    print(error.errorMsg);
  }

  listen() {
    if (available) {
      listening=true;
      _stt.listen(onResult: _resultListener);
    } else {
      print('not available');
    }
  }
  String finalResult="";
  _resultListener(SpeechRecognitionResult result) {
    if(result.confidence>0.8){
      listening=false;
      finalResult=result.recognizedWords;
      _stt.stop();
      notifyListeners();
    }
    print(result.alternates);
    print(result.finalResult);
    print(result.isConfident());
    print(result.toJson());
  }
}
