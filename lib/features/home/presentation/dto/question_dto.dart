class QuestionDto {
  final String question;
  final List<String> options;
  final String answer;

  QuestionDto({
    required this.question,
    required this.options,
    required this.answer,
  });
}
