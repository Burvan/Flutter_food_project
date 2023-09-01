import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:settings/settings.dart';
import 'package:core_ui/core_ui.dart';

class FlutterLabApp extends StatelessWidget {
  const FlutterLabApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (_) => SettingsBloc(
        setThemeUseCase: appLocator.get<SetThemeUseCase>(),
        checkThemeUseCase: appLocator.get<CheckThemeUseCase>(),
        setFontSizeUseCase: appLocator.get<SetFontSizeUseCase>(),
        checkFontSizeUseCase: appLocator.get<CheckFontSizeUseCase>(),
      ),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (BuildContext context, SettingsState state) {
          return MaterialApp.router(
            builder: (_, Widget? child) {
              final MediaQueryData mediaQueryData = MediaQuery.of(context);

              return MediaQuery(
                data: mediaQueryData.copyWith(
                  textScaleFactor: state.textScale,
                ),
                child: child!,
              );
            },
            theme: state.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
            routerDelegate: appLocator.get<AppRouter>().delegate(),
            routeInformationParser:
                appLocator.get<AppRouter>().defaultRouteParser(),
          );
        },
      ),
    );
  }
}
