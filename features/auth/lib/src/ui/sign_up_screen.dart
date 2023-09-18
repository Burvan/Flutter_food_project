import 'package:auth/src/ui/widgets/sign_up_form.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'widgets/app_title.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.size.height,
          width: mediaQuery.size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
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
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
