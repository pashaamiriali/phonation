import 'package:flutter/material.dart';
import 'package:phonation/presentation/home_screen/home_screen.dart';
import 'package:phonation/presentation/provider/home_provider.dart';
import 'package:phonation/presentation/provider/lessons_provider.dart';
import 'package:phonation/presentation/provider/listening_practice_provider.dart';
import 'package:phonation/presentation/provider/pronunciation_practice_provider.dart';
import 'package:phonation/presentation/provider/speech_to_text_provider.dart';
import 'package:phonation/presentation/provider/text_to_speech_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => HomeProvider()),
      ChangeNotifierProvider(create: (ctx) => LessonProvider()),
      ChangeNotifierProvider(create: (ctx) => PronunciationPracticeProvider()),
      ChangeNotifierProvider(create: (ctx) => ListeningPracticeProvider()),
      ChangeNotifierProvider(create: (ctx) => TextToSpeechProvider()),
      ChangeNotifierProvider(create: (ctx) => SpeechToTextProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phonation',
      theme: ThemeData(primarySwatch: Colors.deepPurple, fontFamily: "Karma"),
      home: const HomeScreen(),
    );
  }
}
