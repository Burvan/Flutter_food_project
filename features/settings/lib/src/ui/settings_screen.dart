import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/ui/widgets/font_scale_choice.dart';
import 'package:settings/src/ui/widgets/theme_switcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.padding20),
        child: ListView(
          children: const <Widget>[
            ThemeSwitcher(),
            SizedBox(height: AppSize.size10),
            FontScaleChoice(),
          ],
        ),
      ),
    );
  }
}
