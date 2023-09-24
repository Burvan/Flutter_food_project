import 'package:auth/auth.dart';
import 'package:auth/src/ui/widgets/app_title.dart';
import 'package:auth/src/ui/widgets/sign_in_form.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc bloc = BlocProvider.of<AuthBloc>(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (_, AuthState state) {
          if (state.isLogged) {
            bloc.add(
              const NavigateToHomeScreenEvent(),
            );
          }
        },
        child: SingleChildScrollView(
          child: Container(
            height: mediaQuery.size.height,
            width: mediaQuery.size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  AppColors.brightPink,
                  AppColors.gentlyPink,
                  AppColors.pinkSherbet,
                  AppColors.skyBlue,
                ],
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AppTitle(),
                SizedBox(height: AppSize.size25),
                SignInForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
