import 'package:core/core.dart';
import 'package:core_ui/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (_, SettingsState state) {
        return Switch(
          activeColor: AppColors.darkGrey,
          activeTrackColor: AppColors.white,
          value: state.isDark,
          onChanged: (bool value) {
            BlocProvider.of<SettingsBloc>(context).add(
              ChangeThemeEvent(),
            );
          },
        );
      },
    );
  }
}
