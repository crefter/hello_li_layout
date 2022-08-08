import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_li_layout/core/assets.dart';
import 'package:hello_li_layout/core/colors.dart';
import 'package:hello_li_layout/core/consts.dart';
import 'package:hello_li_layout/core/strings.dart';

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
            bottom: Consts.zero,
            left: Consts.zero,
            child: Image.asset(Assets.blob1),
          ),
          Positioned(
            top: Consts.zero,
            left: Consts.zero,
            child: Image.asset(Assets.blob2),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 5,
            right: Consts.zero,
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
          padding: EdgeInsets.only(
            left: Consts.startScreen.handLeftPadding,
            right: Consts.startScreen.handRightPadding,
          ),
          child: Image.asset(Assets.wavingHand),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: Consts.startScreen.logoTextTopPadding,
            bottom: Consts.startScreen.logoTextBottomPadding,
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
          padding: EdgeInsets.only(
            left: Consts.startScreen.startDescriptionTextLeftRightPadding,
            right:
                Consts.startScreen.startDescriptionTextLeftRightPadding,
          ),
          child: Text(
            Strings.startDescription,
            style: GoogleFonts.roboto(
              textStyle: CupertinoTheme.of(context)
                  .textTheme
                  .textStyle
                  .copyWith(
                    fontSize: Consts.startScreen.startDescriptionTextSize,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Consts.startScreen.startButtonLeftRightPadding,
            right: Consts.startScreen.startButtonLeftRightPadding,
            top: Consts.startScreen.startButtonTopPadding,
            bottom: Consts.startScreen.startButtonBottomPadding,
          ),
          child: CupertinoButton(
            color: Colors.marromClaro2,
            onPressed: () {},
            child: Text(
              Strings.startButton,
              style: CupertinoTheme.of(context)
                  .textTheme
                  .textStyle
                  .copyWith(
                      fontSize: Consts.startScreen.startButtonTextSize,
                      color: Colors.c1),
            ),
          ),
        ),
      ],
    );
  }
}
