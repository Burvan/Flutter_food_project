import 'package:auth/auth.dart';
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
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(
            appRouter: appLocator.get<AppRouter>(),
            signInUseCase: appLocator.get<SignInUseCase>(),
            signInUsingGoogleAccUseCase: appLocator.get<GoogleSignInUseCase>(),
            signUpUseCase: appLocator.get<SignUpUseCase>(),
            signOutUseCase: appLocator.get<SignOutUseCase>(),
            getStoredUserUseCase: appLocator.get<GetStoredUserUseCase>(),
          ),
        ),
        BlocProvider<SettingsBloc>(
          create: (_) =>
              SettingsBloc(
                setThemeUseCase: appLocator.get<SetThemeUseCase>(),
                checkThemeUseCase: appLocator.get<CheckThemeUseCase>(),
                setFontSizeUseCase: appLocator.get<SetFontSizeUseCase>(),
                checkFontSizeUseCase: appLocator.get<CheckFontSizeUseCase>(),
              ),
        ),
      ],
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
            theme: state.isDark ? AppTheme.darkTheme : state.themeData,
            darkTheme: state.isDark ? AppTheme.darkTheme : state.themeData,
            routerDelegate: appLocator.get<AppRouter>().delegate(),
            routeInformationParser:
            appLocator.get<AppRouter>().defaultRouteParser(),
          );
        },
      ),
    );
  }
}
