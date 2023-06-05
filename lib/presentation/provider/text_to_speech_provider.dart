import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum TTSState {
  idle,
  playing,
  stopped,
  paused,
  continued,
  initialized;
}

class TextToSpeechProvider extends ChangeNotifier {
  late FlutterTts _tts;
  bool initialized = false;
  TTSState ttsState = TTSState.idle;
  bool isLoading=false;
  Future initialize() async {
    isLoading=true;
    notifyListeners();
    _tts = FlutterTts();
    List<dynamic> languages = await _tts.getLanguages;
    await _tts.setLanguage('en-GB');
    await _tts.setSpeechRate(0.4);
    await _tts.setVolume(1.0);
    await _tts.setPitch(5.0);
    _tts.setStartHandler(() {
      ttsState = TTSState.playing;
    });

    _tts.setCompletionHandler(() {
      ttsState = TTSState.stopped;
      notifyListeners();
    });

    _tts.setProgressHandler(
        (String text, int startOffset, int endOffset, String word) {
      currentWord = word;
      notifyListeners();
    });

    _tts.setErrorHandler((msg) {
      ttsState = TTSState.stopped;
      notifyListeners();
    });

    _tts.setCancelHandler(() {
      ttsState = TTSState.stopped;
      notifyListeners();
    });

// Android, iOS and Web
    _tts.setPauseHandler(() {
      ttsState = TTSState.paused;
      notifyListeners();
    });

    _tts.setContinueHandler(() {
      ttsState = TTSState.continued;
      notifyListeners();
    });

// Android only
    if (Platform.isAndroid) {
      _tts.setInitHandler(() {
        ttsState = TTSState.initialized;
        notifyListeners();
      });
    }
    initialized=true;
    isLoading=false;
    notifyListeners();
  }

  String currentWord = "";
  String _text = "";

  String get text => _text;

  set text(String value) {
    _text = value;
    notifyListeners();
  }

  Future speak() async {
    var result = await _tts.speak(text);
    if (result == 1) {
      ttsState = TTSState.playing;
      notifyListeners();
    }
  }

  Future stop() async {
    var result = await _tts.stop();
    if (result == 1) {
      ttsState = TTSState.stopped;
      notifyListeners();
    }
  }
}
