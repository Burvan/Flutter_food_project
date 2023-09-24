import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/ui/widgets/contact_us.dart';
import 'package:settings/src/ui/widgets/font_scale_choice.dart';
import 'package:settings/src/ui/widgets/sign_out.dart';
import 'package:settings/src/ui/widgets/theme_switcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppPadding.padding20),
        child: Column(
          children: <Widget>[
            ThemeSwitcher(),
            SizedBox(height: AppSize.size10),
            FontScaleChoice(),
            SizedBox(height: AppSize.size10),
            SignOut(),
            Spacer(),
            ContactUs(),
          ],
        ),
      ),
    );
  }
}
