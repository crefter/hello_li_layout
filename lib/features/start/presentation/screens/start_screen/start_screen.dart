import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_li_layout/core/core_colors.dart';
import 'package:hello_li_layout/core/core_consts.dart' as core_consts;
import 'package:hello_li_layout/core/presentation/navigation/core_navigation.dart';
import 'package:hello_li_layout/core/core_strings.dart';
import 'package:hello_li_layout/features/start/assets.dart';
import 'package:hello_li_layout/features/start/colors.dart';
import 'package:hello_li_layout/features/start/consts.dart' as start_consts;

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ColoredBox(
      color: StartColors.startScreenBackgroundColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: core_consts.CoreConsts.zero,
            left: core_consts.CoreConsts.zero,
            child: Image.asset(
              Assets.blob1,
            ),
          ),
          Positioned(
            top: core_consts.CoreConsts.zero,
            left: core_consts.CoreConsts.zero,
            child: Image.asset(
              Assets.blob2,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 5,
            right: core_consts.CoreConsts.zero,
            child: Image.asset(
              Assets.blob3,
            ),
          ),
          const _StartScreenLogo(),
          const _DescriptionAndButton(),
        ],
      ),
    ));
  }
}

class _StartScreenLogo extends StatelessWidget {
  const _StartScreenLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: start_consts.Consts.handLeftPadding,
            right: start_consts.Consts.handRightPadding,
          ),
          child: Image.asset(Assets.wavingHand),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: start_consts.Consts.logoTextTopPadding,
            bottom: start_consts.Consts.logoTextBottomPadding,
          ),
          child: Image.asset(Assets.logoText),
        ),
      ],
    );
  }
}

class _DescriptionAndButton extends StatelessWidget {
  const _DescriptionAndButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        _DescriptionText(),
        _Button(),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: start_consts.Consts.startButtonLeftRightPadding,
        right: start_consts.Consts.startButtonLeftRightPadding,
        top: start_consts.Consts.startButtonTopPadding,
        bottom: start_consts.Consts.startButtonBottomPadding,
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, Screens.main);
        },
        style: ElevatedButton.styleFrom(
          primary: CoreColors.marromClaro2,
          minimumSize: const Size(275, 48),
        ),
        child: Text(
          Strings.startButton,
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: start_consts.Consts.startButtonTextSize,
              color: CoreColors.c1),
        ),
      ),
    );
  }
}

class _DescriptionText extends StatelessWidget {
  const _DescriptionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: start_consts.Consts.startDescriptionTextLeftRightPadding,
        right: start_consts.Consts.startDescriptionTextLeftRightPadding,
      ),
      child: Text(
        Strings.startDescription,
        style: GoogleFonts.roboto(
          textStyle: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                fontSize: start_consts.Consts.startDescriptionTextSize,
                fontWeight: FontWeight.w300,
              ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
