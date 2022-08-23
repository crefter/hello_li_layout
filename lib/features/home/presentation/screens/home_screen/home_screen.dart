import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_li_layout/core/core_colors.dart';
import 'package:hello_li_layout/core/core_consts.dart';
import 'package:hello_li_layout/features/home/domain/entities/module.dart';
import 'package:hello_li_layout/features/home/home_assets.dart';
import 'package:hello_li_layout/features/home/home_colors.dart';
import 'package:hello_li_layout/features/home/home_consts.dart';

class HomeScreen extends StatelessWidget {
  static const List<Module> _modules = [
    Module(
        image: HomeAssets.thumbsUp,
        name: 'Числа',
        videosCount: 4,
        isLocked: true),
    Module(
        image: HomeAssets.raisedFist,
        name: 'Грамматика',
        videosCount: 8,
        isLocked: true),
    Module(
        image: HomeAssets.wavingHand,
        name: 'Приветствие',
        videosCount: 16,
        isLocked: true),
  ];

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return ColoredBox(
      color: CoreColors.backgroundColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: CoreColors.backgroundColor,
            elevation: CoreConsts.zero,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                _Logo(),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  CupertinoIcons.bell,
                  color: CoreColors.marromEscuro,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.only(left: HomeConsts.moduleLeftPadding),
                  child: Text(
                    'Давайте узнаем, что сегодня?',
                    style: GoogleFonts.inter(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      fontSize: HomeConsts.descriptionTextFontSizeInCard,
                      color: CoreColors.c3,
                      height: HomeConsts.textHeight,
                    ),
                  ),
                ),
                _Card(width: width),
                Padding(
                  padding:
                      const EdgeInsets.only(left: HomeConsts.moduleLeftPadding),
                  child: Text(
                    'Модули',
                    style: GoogleFonts.roboto(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: HomeConsts.moduleFontSize,
                      color: CoreColors.marromEscuro,
                      height: HomeConsts.moduleHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              final module = _modules[index];
              return _ModuleItemWidget(module: module);
            },
            childCount: _modules.length,
          )),
        ],
      ),
    );
  }
}

class _ModuleItemWidget extends StatelessWidget {
  const _ModuleItemWidget({
    Key? key,
    required this.module,
  }) : super(key: key);

  final Module module;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(HomeConsts.moduleItemPadding),
      child: _ModuleWidget(module: module),
    );
  }
}

class _ModuleWidget extends StatelessWidget {
  const _ModuleWidget({
    Key? key,
    required this.module,
  }) : super(key: key);

  final Module module;

  @override
  Widget build(BuildContext context) {
    const cardHorizontalPadding = HomeConsts.moduleAndChipsTopPadding * 2;
    final double gap = MediaQuery.of(context).size.width -
        cardHorizontalPadding -
        HomeConsts.moduleWidthNeedsRemove;
    return Material(
      borderRadius: BorderRadius.circular(HomeConsts.moduleBorderRadius),
      color: CoreColors.white,
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _ImageInCardWidget(
              asset: module.image,
            ),
            _NameAndChipsWidget(
              videosCount: module.videosCount.toString(),
              name: module.name,
            ),
            SizedBox(width: gap),
            _LockIcon(isLocked: module.isLocked),
          ],
        ),
      ),
    );
  }
}

class _LockIcon extends StatelessWidget {
  final bool isLocked;

  const _LockIcon({Key? key, required this.isLocked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLocked ? const Icon(Icons.lock) : const Icon(Icons.lock_open);
  }
}

class _NameAndChipsWidget extends StatelessWidget {
  final String name;
  final String videosCount;

  const _NameAndChipsWidget({
    Key? key,
    required this.name,
    required this.videosCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: HomeConsts.moduleAndChipsTopPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: HomeConsts.moduleAndChipsPadding,
            ),
            child: Text(name),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: HomeConsts.moduleAndChipsPadding),
            child: SizedBox(
              height: HomeConsts.chipsHeight,
              child: Row(
                children: [
                  _ModuleChip(
                    backgroundColor: HomeColors.chipVideosColor,
                    text: '$videosCount Видео',
                    textColor: HomeColors.chipTextVideosColor,
                  ),
                  const SizedBox(
                    width: HomeConsts.gapBetweenChips,
                  ),
                  _ModuleChip(
                      backgroundColor: HomeColors.chipColor,
                      textColor: HomeColors.chipTextColor,
                      text: '0~$videosCount')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageInCardWidget extends StatelessWidget {
  final String asset;

  const _ImageInCardWidget({
    Key? key,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: HomeConsts.imageInCardPadding,
        left: HomeConsts.imageInCardPadding,
        bottom: HomeConsts.imageInCardPadding,
        right: HomeConsts.defaultCardPadding,
      ),
      child: Image.asset(asset),
    );
  }
}

class _ModuleChip extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;

  const _ModuleChip({
    Key? key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(
        horizontal: HomeConsts.chipHorizontalPadding,
      ),
      labelPadding: const EdgeInsets.only(top: HomeConsts.chipLabelPadding),
      backgroundColor: backgroundColor,
      label: Text(
        text,
        style: GoogleFonts.roboto(
          fontStyle: FontStyle.normal,
          fontSize: HomeConsts.chipFontSize,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: HomeConsts.cardHorizontalPadding,
        right: HomeConsts.cardHorizontalPadding,
        top: HomeConsts.cardTopPadding,
        bottom: HomeConsts.defaultCardPadding,
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: CoreColors.amarelo,
          borderRadius: BorderRadius.all(
            Radius.circular(HomeConsts.cardBorderRadius),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: width - HomeConsts.widthFactor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: HomeConsts.defaultCardPadding,
                      top: HomeConsts.defaultCardPadding,
                      bottom: HomeConsts.headerInCardBottomPadding,
                    ),
                    child: Text(
                      'Язык жестов',
                      style: GoogleFonts.roboto(
                        fontStyle: FontStyle.normal,
                        fontSize: HomeConsts.headerInCardFontSize,
                        fontWeight: FontWeight.w700,
                        color: CoreColors.marromEscuro,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: HomeConsts.descriptionTextInCardLeftPadding,
                    ),
                    child: Text(
                      'Сан-синайский алфафит, выполненный жестами',
                      softWrap: true,
                      style: GoogleFonts.roboto(
                        fontStyle: FontStyle.normal,
                        fontSize: HomeConsts.descriptionTextFontSizeInCard,
                        fontWeight: FontWeight.w300,
                        color: CoreColors.marromClaro2,
                        height: HomeConsts.descriptionTextHeightInCard,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: HomeConsts.defaultCardPadding,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: HomeConsts.defaultCardPadding,
                      bottom: HomeConsts.defaultCardPadding,
                    ),
                    child: _ButtonInCard(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: HomeConsts.defaultCardPadding,
              ),
              child: Image.asset(HomeAssets.crossedFingers),
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonInCard extends StatelessWidget {
  const _ButtonInCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(
        Radius.circular(HomeConsts.buttonInCardBorderRadius),
      ),
      color: CoreColors.white,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: HomeConsts.verticalButtonInCardPadding,
            horizontal: HomeConsts.horizontalButtonInCardPadding,
          ),
          child: Text(
            'Продолжить урок',
            style: GoogleFonts.roboto(
              fontStyle: FontStyle.normal,
              fontSize: HomeConsts.textFontSizeInButtonInCard,
              fontWeight: FontWeight.w400,
              color: CoreColors.marromEscuro,
              height: HomeConsts.textHeightInButtonInCard,
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset(HomeAssets.helloHome),
        const SizedBox(width: CoreConsts.spaceBetweenLogoImageAndText),
        Text(
          'LIvia',
          style: GoogleFonts.inter(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
            fontSize: CoreConsts.logoFontSize,
            color: CoreColors.marromEscuro,
            height: CoreConsts.logoFontHeight,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
