import 'package:flutter/material.dart';
import 'package:hello_li_layout/features/profile/presentation/dto/settings_list_state_dto.dart';

class SettingsListInheritedWidget extends InheritedWidget {
  final ValueNotifier<SettingsListStateDto> settingsListState;

  SettingsListInheritedWidget({
    Key? key,
    required Widget child,
  })  : settingsListState = ValueNotifier<SettingsListStateDto>(
            SettingsListStateDto(false, false, false)),
        super(key: key, child: child);

  static SettingsListInheritedWidget of(BuildContext context) {
    final SettingsListInheritedWidget? result = context
        .dependOnInheritedWidgetOfExactType<SettingsListInheritedWidget>();
    assert(result != null, 'No SettingsListInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(SettingsListInheritedWidget old) {
    return old.settingsListState != settingsListState;
  }
}
