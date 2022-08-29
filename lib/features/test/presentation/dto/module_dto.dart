import 'package:hello_li_layout/features/home/presentation/dto/question_dto.dart';

class ModuleDto {
  final String image;
  final String name;
  final String videoLink;
  final List<QuestionDto> questions;

  ModuleDto({
    required this.image,
    required this.name,
    required this.videoLink,
    required this.questions,
  });
}
