import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_li_layout/core/core_colors.dart';
import 'package:hello_li_layout/features/main/presentation/screens/main_screen/bottom_nav_bar_inherited_widget.dart';
import 'package:hello_li_layout/features/profile/presentation/dto/settings_list_state_dto.dart';
import 'package:hello_li_layout/features/profile/presentation/screens/settings_list_inherited_widget.dart';
import 'package:hello_li_layout/features/profile/profile_assets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ValueNotifier<int> _index;

  @override
  void didChangeDependencies() {
    _index = BottomNavBarInheritedWidget.watch(context).index;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: CoreColors.white,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: CoreColors.white,
            leading: IconButton(
              onPressed: () {
                _index.value = 0;
              },
              icon: const Icon(
                Icons.arrow_back,
                color: CoreColors.marromEscuro,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: CoreColors.marromEscuro,
                ),
              ),
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: _Profile(),
            ),
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: _Progress(),
            ),
            const SizedBox(
              height: 32,
            ),
          ])),
          SliverPadding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            sliver: SettingsListInheritedWidget(child: const _SettingsList()),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
        ],
      ),
    );
  }
}

class _SettingsList extends StatefulWidget {
  const _SettingsList({
    Key? key,
  }) : super(key: key);

  @override
  State<_SettingsList> createState() => _SettingsListState();
}

class _SettingsListState extends State<_SettingsList> {
  late final List<_SettingsItemListState> _states;

  @override
  void initState() {
    super.initState();
    _states = [
      _SettingsItemListState(
        Icons.person_outline_outlined,
        'Editar perfil',
        () => IconButton(
          icon: const Icon(CupertinoIcons.right_chevron),
          onPressed: () {},
        ),
      ),
      _SettingsItemListState(
        Icons.ssid_chart_outlined,
        'Editar meta diária',
        () => IconButton(
          icon: const Icon(CupertinoIcons.right_chevron),
          onPressed: () {},
        ),
      ),
      _SettingsItemListState(
        Icons.telegram,
        'Compartilhar progresso',
        () => IconButton(
          icon: const Icon(CupertinoIcons.right_chevron),
          onPressed: () {},
        ),
      ),
      _SettingsItemListState(
        CupertinoIcons.bell,
        'Lembrete para praticar',
        () => SizedBox(
          width: 48,
          height: 48,
          child: FittedBox(
            fit: BoxFit.contain,
            child: ValueListenableBuilder<SettingsListStateDto>(
              valueListenable:
                  SettingsListInheritedWidget.of(context).settingsListState,
              builder: (_, value, __) {
                return CupertinoSwitch(
                    value: value.valueNotification,
                    onChanged: (newValue) =>
                        value.valueNotification = newValue);
              },
            ),
          ),
        ),
      ),
      _SettingsItemListState(
        Icons.access_time_outlined,
        'Efeitos sonoros',
        () => SizedBox(
          width: 48,
          height: 48,
          child: FittedBox(
            fit: BoxFit.contain,
            child: ValueListenableBuilder<SettingsListStateDto>(
              valueListenable:
                  SettingsListInheritedWidget.of(context).settingsListState,
              builder: (_, value, __) {
                return CupertinoSwitch(
                    value: value.valueTimer,
                    onChanged: (newValue) => value.valueTimer = newValue);
              },
            ),
          ),
        ),
      ),
      _SettingsItemListState(
        Icons.dark_mode_outlined,
        'Modo escuro',
        () => SizedBox(
          width: 48,
          height: 48,
          child: FittedBox(
            fit: BoxFit.contain,
            child: ValueListenableBuilder<SettingsListStateDto>(
                valueListenable:
                    SettingsListInheritedWidget.of(context).settingsListState,
                builder: (_, value, ___) {
                  return CupertinoSwitch(
                      value: value.valueMode,
                      onChanged: (newValue) => value.valueMode = newValue);
                }),
          ),
        ),
      ),
      _SettingsItemListState(
        Icons.exit_to_app,
        'Sair da conta',
        () => IconButton(
          icon: const Icon(CupertinoIcons.right_chevron),
          onPressed: () {},
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            decoration: const BoxDecoration(
              color: CoreColors.c1,
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                ..._states.map<Widget>((state) {
                  return Material(
                    child: ListTile(
                      leading: Icon(
                        state.leading,
                        color: CoreColors.marromEscuro,
                      ),
                      title: Text(
                        state.text,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.5,
                          color: CoreColors.marromEscuro,
                        ),
                      ),
                      trailing: state.trailing(),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 32,
          height: 32,
          child: CircleAvatar(
            child: Image.asset(ProfileAssets.profilePhoto),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          'Livia Rodino',
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              height: 1.5,
              color: CoreColors.marromEscuro),
        )
      ],
    );
  }
}

class _Progress extends StatelessWidget {
  const _Progress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 0,
      color: CoreColors.c1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 32,
              bottom: 32,
            ),
            child: Text(
              'Meu Progresso\nno curso',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  height: 1.5,
                  color: CoreColors.marromEscuro),
              softWrap: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              right: 16,
              bottom: 16,
            ),
            child: SizedBox(
              width: 94,
              height: 94,
              child: Center(
                child: Stack(
                  children: [
                    const _CircularIndicator(
                      color: CoreColors.c2,
                      value: 1,
                      strokeWidth: 3,
                    ),
                    const _CircularIndicator(
                      color: CoreColors.amarelo,
                      value: 0.18,
                      strokeWidth: 6,
                    ),
                    Center(
                      child: Text(
                        '18%',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          height: 1.5,
                          color: CoreColors.marromEscuro,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CircularIndicator extends StatelessWidget {
  final double value;
  final Color color;
  final double strokeWidth;

  const _CircularIndicator({
    Key? key,
    required this.value,
    required this.color,
    required this.strokeWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 94,
      height: 94,
      child: CircularProgressIndicator(
        value: value,
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class _SettingsItemListState {
  final IconData leading;
  final String text;
  final Widget Function() trailing;

  _SettingsItemListState(this.leading, this.text, this.trailing);
}
