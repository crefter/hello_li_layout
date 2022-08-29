import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_li_layout/core/core_colors.dart';
import 'package:hello_li_layout/features/test/presentation/dto/module_dto.dart';
import 'package:hello_li_layout/features/test/presentation/dto/question_dto.dart';
import 'package:hello_li_layout/features/test/presentation/test_assets.dart';
import 'package:hello_li_layout/features/test/presentation/test_colors.dart';

final ModuleDto moduleDto = ModuleDto(
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

int answer = -1;

class TestScreen extends StatefulWidget {
  final int moduleId;

  const TestScreen({Key? key, required this.moduleId}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int question = 0;
  late double progress;

  @override
  Widget build(BuildContext context) {
    progress = question.toDouble() / (moduleDto.questions.length - 1);
    return Scaffold(
      body: ColoredBox(
        color: CoreColors.backgroundColor,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: CoreColors.backgroundColor,
              automaticallyImplyLeading: false,
              title: SizedBox(
                height: 16,
                width: MediaQuery.of(context).size.width - 125,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: CoreColors.c2,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        TestColors.progressColor),
                  ),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.clear_rounded,
                      color: CoreColors.marromEscuro,
                    )),
              ],
            ),
            const _SliverSizedBox(
              height: 36,
              width: 0,
            ),
            _VideoWidget(),
            const _SliverSizedBox(height: 16, width: 0),
            _TextWidget(),
            const _SliverSizedBox(height: 32, width: 0),
            SliverPadding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              sliver: _OptionsList(
                question: question,
              ),
            ),
            const _SliverSizedBox(height: 56, width: 0),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: _VerificationButton(
                  onTapped: _verificationButtonClicked,
                ),
              ),
            ),
            const _SliverSizedBox(height: 41, width: 0),
          ],
        ),
      ),
    );
  }

  void _verificationButtonClicked() {
    setState(() {
      if (question < moduleDto.questions.length - 1 &&
          answer == moduleDto.questions[question].answer) {
        answer = -1;
        question++;
      }
    });
  }
}

class _OptionsList extends StatefulWidget {
  final int question;

  const _OptionsList({required this.question});

  @override
  State<_OptionsList> createState() => _OptionsListState();
}

class _OptionsListState extends State<_OptionsList> {
  String? _character = 'zero';

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: moduleDto.questions[widget.question].options.length,
        (context, index) {
          return InkWell(
            onTap: () {
              _radioOnTapped(
                  moduleDto.questions[widget.question].options[index], index);
              if (index == moduleDto.questions[widget.question].answer) {
                answer = index;
              }
            },
            child: Row(
              children: [
                Radio<String>(
                  value: moduleDto.questions[widget.question].options[index],
                  groupValue: _character,
                  onChanged: (newValue) => _radioOnTapped(newValue, index),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  moduleDto.questions[widget.question].options[index],
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _radioOnTapped(String? newValue, int index) {
    setState(() {
      _character = newValue;
      answer = index;
    });
  }
}

class _TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(
          'Selecione o que foi mostrado no video',
          style: GoogleFonts.roboto(
              fontSize: 16,
              height: 1.5,
              color: CoreColors.marromEscuro,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}

class _VideoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Stack(
          children: [
            Image.asset(TestAssets.video),
            Positioned(
              left: 24,
              bottom: 24,
              child: _PlayButtonWidget(),
            ),
            Positioned(
              top: 26,
              right: 26,
              child: _InfoWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.info,
        color: CoreColors.c2,
        size: 20,
      ),
    );
  }
}

class _PlayButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.play_circle_fill_outlined,
        color: CoreColors.marromEscuro,
        size: 33,
      ),
    );
  }
}

class _VerificationButton extends StatelessWidget {
  final void Function() onTapped;

  const _VerificationButton({required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Material(
        color: CoreColors.marromClaro2,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTapped,
          child: Center(
            child: Text(
              'Verificar',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                height: 1.5,
                color: CoreColors.c1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverSizedBox extends StatelessWidget {
  final double height;
  final double width;

  const _SliverSizedBox({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}
