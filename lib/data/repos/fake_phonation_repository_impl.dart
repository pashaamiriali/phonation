import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:phonation/core/abstract/repository/phonation_repository.dart';
import 'package:phonation/core/entities/lesson.dart';
import 'package:phonation/core/entities/level.dart';
import 'package:phonation/core/entities/pronunciation_practice.dart';

class FakePhonationRepositoryIMPL extends PhonationRepository {
  @override
  Future<List<Level>> fetchLevels() async {
    List levelsList = jsonDecode(
        await rootBundle.loadString('assets/json/levels.json'))['levels'];
    List<Level> levels = [];
    for (var level in levelsList) {
      levels.add(Level.fromJson(level));
    }
    return levels;
  }

  @override
  Future<List<Lesson>> fetchLessonsForLevel(int levelId) async {
    List lessonsList = jsonDecode(
        await rootBundle.loadString('assets/json/lessons.json'))['lessons'];
    List<Lesson> lessons = [];
    for (var lesson in lessonsList) {
      if (lesson['levelId'] == levelId) {
        lessons.add(Lesson.fromJson(lesson));
      }
    }
    return lessons;
  }

  @override
  Future<List<PronunciationPractice>> fetchPronunciationPractice(
      int lessonId) async {
    List<PronunciationPractice> practices = [];
    List practicesList = jsonDecode(await rootBundle
        .loadString('assets/json/pronunciation_practice.json'))['practices'];
    for (var practice in practicesList) {
      if (practice['lessonId'] == lessonId) {
        practices.add(PronunciationPractice.fromJson(practice));
      }
    }
    return practices;
  }
}
