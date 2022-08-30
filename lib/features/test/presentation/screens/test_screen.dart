import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_li_layout/core/core_colors.dart';
import 'package:hello_li_layout/features/test/presentation/test_assets.dart';
import 'package:hello_li_layout/features/test/presentation/test_colors.dart';
import 'package:hello_li_layout/features/test/presentation/test_consts.dart';
import 'package:hello_li_layout/features/test/presentation/widgets/test_inherited_widget.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late final TestInheritedWidget _testInherited;
  late double progress;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _testInherited = TestInheritedWidget.of(context);
  }

  @override
  Widget build(BuildContext context) {
    progress = _testInherited.question.toDouble() /
        (_testInherited.questions.length - 1);
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
                width: MediaQuery.of(context).size.width -
                    TestConsts.gapFromProgressToCross,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      TestConsts.progressIndicatorBorderRadius),
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
            const _SliverSizedBox(
                height: TestConsts.gapBetweenVideoAndText, width: 0),
            _TextWidget(),
            const _SliverSizedBox(
                height: TestConsts.gapBetweenTextAndOptions, width: 0),
            _testInherited.isFinished
                ? const SliverToBoxAdapter(
                    child: Center(
                      child: Text('Тест выполнен!'),
                    ),
                  )
                : SliverPadding(
                    padding: const EdgeInsets.only(
                        left: TestConsts.optionsPadding,
                        right: TestConsts.optionsPadding),
                    sliver: _OptionsList(
                      question: _testInherited.question,
                    ),
                  ),
            const _SliverSizedBox(
                height: TestConsts.gapBetweenOptionsAndVerificationButton,
                width: 0),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: TestConsts.verificationButtonPadding),
                child: _VerificationButton(
                  onTapped: _verificationButtonClicked,
                ),
              ),
            ),
            const _SliverSizedBox(
                height: TestConsts.paddingFromBottom, width: 0),
          ],
        ),
      ),
    );
  }

  void _verificationButtonClicked() {
    setState(() {
      if (_testInherited.question < _testInherited.questions.length &&
          _testInherited.answer ==
              _testInherited.questions[_testInherited.question].answer) {
        _testInherited.nextQuestion();
      }
      if (_testInherited.isFinished) {
        _testInherited.testFinished();
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
  late final TestInheritedWidget _testInherited;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _testInherited = TestInheritedWidget.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: _testInherited.questions[widget.question].options.length,
        (context, index) {
          return InkWell(
            onTap: () {
              _radioOnTapped(
                  _testInherited.questions[widget.question].options[index],
                  index);
            },
            child: Row(
              children: [
                Radio<String>(
                  value:
                      _testInherited.questions[widget.question].options[index],
                  groupValue: _character,
                  onChanged: (newValue) => _radioOnTapped(newValue, index),
                ),
                const SizedBox(
                  width: TestConsts.gapBetweenRadioAndOptionText,
                ),
                Text(
                  _testInherited.questions[widget.question].options[index],
                  style: const TextStyle(
                    fontSize: TestConsts.optionTextSize,
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
      _testInherited.onRadioTapped(index);
    });
  }
}

class _TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: TestConsts.textLeftPadding),
        child: Text(
          'Selecione o que foi mostrado no video',
          style: GoogleFonts.roboto(
              fontSize: TestConsts.textSize,
              height: TestConsts.textHeight,
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
        size: TestConsts.infoIconSize,
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
        size: TestConsts.playIconSize,
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
      height: TestConsts.verificationButtonHeight,
      child: Material(
        color: CoreColors.marromClaro2,
        borderRadius:
            BorderRadius.circular(TestConsts.verificationButtonBorderRadius),
        child: InkWell(
          onTap: TestInheritedWidget.of(context).isFinished
              ? () => Navigator.pop(context)
              : onTapped,
          child: Center(
            child: Text(
              TestInheritedWidget.of(context).buttonText,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700,
                fontSize: TestConsts.textSize,
                height: TestConsts.textHeight,
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
