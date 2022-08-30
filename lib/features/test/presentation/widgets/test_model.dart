import 'package:flutter/material.dart';
import 'package:hello_li_layout/features/test/presentation/dto/module_dto.dart';
import 'package:hello_li_layout/features/test/presentation/dto/question_dto.dart';
import 'package:hello_li_layout/features/test/presentation/test_assets.dart';

class TestModel extends ChangeNotifier {
  late ModuleDto modul;
  int answer = -1;
  int question = 0;
  String buttonText = 'Verificar';

  bool get isFinished => question == modul.questions.length;

  void loadModule(int id) {
    modul = ModuleDto(
      questions: [
        QuestionDto(
            videoLink: TestAssets.video,
            options: ['👍 🤟 🤞 ✊ 🤙', '🤞 🤙 👍 ✊ 🤟', '✊ 👍 🤞 🤟 🤙'],
            answer: 0),
        QuestionDto(
            videoLink: TestAssets.video,
            options: ['🤞 🤙 👍 ✊ 🤟', '👍 🤟 🤞 ✊ 🤙', '✊ 👍 🤞 🤟 🤙'],
            answer: 1),
        QuestionDto(
            videoLink: TestAssets.video,
            options: ['✊ 👍 🤞 🤟 🤙', '🤞 🤙 👍 ✊ 🤟', '👍 🤟 🤞 ✊ 🤙'],
            answer: 2),
      ],
    );
    notifyListeners();
  }

  void nextQuestion() {
    answer = -1;
    question++;
    notifyListeners();
  }

  void testFinished() {
    buttonText = 'Back to home';
    notifyListeners();
  }

  void onRadioTapped(int index) {
    answer = index;
    notifyListeners();
  }
}
