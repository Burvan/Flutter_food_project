import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:core_ui/core_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeScreenRoute(),
        CartScreenRoute(),
        OrderHistoryScreenRoute(),
        SettingsScreenRoute(),
      ],
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          actions: const [
            ThemeSwitcher(),
          ],
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Nice',
                style: AppTextTheme.font32Bold,
              ),
              Text(
                ' food delivery',
                style: AppTextTheme.font24,
              ),
            ],
          ),
        );
      },
      bottomNavigationBuilder: (BuildContext context, TabsRouter tabsRouter) {
        return AppBottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}
