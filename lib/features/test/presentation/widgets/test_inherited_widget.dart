import 'package:flutter/material.dart';
import 'package:hello_li_layout/features/test/presentation/dto/question_dto.dart';
import 'package:hello_li_layout/features/test/presentation/widgets/test_model.dart';

class TestInheritedWidget extends InheritedWidget {
  final TestModel testModel = TestModel();

  int get question => testModel.question;

  int get answer => testModel.answer;

  List<QuestionDto> get questions => testModel.modul.questions;

  bool get isFinished => testModel.isFinished;

  String get buttonText => testModel.buttonText;

  TestInheritedWidget({
    Key? key,
    required Widget child,
    required int id,
  }) : super(key: key, child: child) {
    loadModule(id);
  }

  static TestInheritedWidget of(BuildContext context) {
    final TestInheritedWidget? result =
        context.dependOnInheritedWidgetOfExactType<TestInheritedWidget>();
    assert(result != null, 'No TestInheritedWidget found in context');
    return result!;
  }

  void loadModule(int id) {
    testModel.loadModule(id);
  }

  void testFinished() {
    testModel.testFinished();
  }

  void nextQuestion() {
    testModel.nextQuestion();
  }

  void onRadioTapped(int index) {
    testModel.onRadioTapped(index);
  }

  @override
  bool updateShouldNotify(TestInheritedWidget old) {
    return old.testModel != testModel;
  }
}
