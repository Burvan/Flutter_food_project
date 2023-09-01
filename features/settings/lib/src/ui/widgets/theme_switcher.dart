import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsBloc bloc = BlocProvider.of<SettingsBloc>(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (_, SettingsState state) {
        return Padding(
          padding: const EdgeInsets.all(AppPadding.padding20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                AppString.useADarkTheme,
                style: AppTextTheme.font22,
              ),
              Switch(
                value: state.isDark,
                onChanged: (bool value) {
                  bloc.add(
                    ChangeThemeEvent(isDark: value),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
