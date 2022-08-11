import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_li_layout/core/colors.dart';
import 'package:hello_li_layout/core/consts.dart' as core_consts;
import 'package:hello_li_layout/core/strings.dart';
import 'package:hello_li_layout/features/start/assets.dart';
import 'package:hello_li_layout/features/start/consts.dart' as start_consts;

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: ColoredBox(
      color: Colors.startScreenBackgroundColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: core_consts.Consts.zero,
            left: core_consts.Consts.zero,
            child: Image.asset(Assets.blob1),
          ),
          Positioned(
            top: core_consts.Consts.zero,
            left: core_consts.Consts.zero,
            child: Image.asset(Assets.blob2),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 5,
            right: core_consts.Consts.zero,
            child: Image.asset(Assets.blob3),
          ),
          const _StartScreenLogo(),
          const _DescriptionAndButton()
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
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: start_consts.Consts.startDescriptionTextLeftRightPadding,
            right: start_consts.Consts.startDescriptionTextLeftRightPadding,
          ),
          child: Text(
            Strings.startDescription,
            style: GoogleFonts.roboto(
              textStyle:
                  CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                        fontSize: start_consts.Consts.startDescriptionTextSize,
                        fontWeight: FontWeight.w300,
                      ),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: start_consts.Consts.startButtonLeftRightPadding,
            right: start_consts.Consts.startButtonLeftRightPadding,
            top: start_consts.Consts.startButtonTopPadding,
            bottom: start_consts.Consts.startButtonBottomPadding,
          ),
          child: CupertinoButton(
            color: Colors.marromClaro2,
            onPressed: () {},
            child: Text(
              Strings.startButton,
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: start_consts.Consts.startButtonTextSize,
                  color: Colors.c1),
            ),
          ),
        ),
      ],
    );
  }
}
