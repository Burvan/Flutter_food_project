import 'package:flutter/material.dart';
import 'package:settings/src/ui/widgets/theme_switcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const <Widget>[
          ThemeSwitcher(),
        ],
      ),
    );
  }
}
