class QuestionDto {
  final List<String> options;
  final int answer;
  final String videoLink;

  QuestionDto({
    required this.options,
    required this.answer,
    required this.videoLink,
  });
}
