import 'package:auth/auth.dart';
import 'package:auth/src/ui/widgets/app_text_field.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'auth_button.dart';
import 'offer_another_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthBloc bloc = BlocProvider.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
      height: mediaQuery.size.height / AppScale.scaleOne5,
      width: mediaQuery.size.width / AppScale.scaleOne2,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          AppBorderRadius.borderRadius12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: AppSize.size25),
          const Text(
            AppString.pleaseSignUpInApp,
            style: AppTextTheme.font18Grey,
          ),
          const SizedBox(height: AppSize.size25),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.padding20,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  AppTextField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.length < 5) {
                        return AppString.invalidNameFormat;
                      } else {
                        return null;
                      }
                    },
                    labelText: AppString.name,
                    obscureText: false,
                    icon: const Icon(Icons.person_outline),
                  ),
                  const SizedBox(height: AppSize.size20),
                  AppTextField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.length < 5 ||
                          !value.contains('@') ||
                          !value.contains('.')) {
                        return AppString.invalidEmailFormat;
                      }
                      return null;
                    },
                    labelText: AppString.emailAddress,
                    obscureText: false,
                    icon: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(height: AppSize.size20),
                  AppTextField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.length < 6) {
                        return AppString.invalidPassword;
                      } else {
                        return null;
                      }
                    },
                    helperText: AppString.helperTextForPassword,
                    labelText: AppString.password,
                    obscureText: true,
                    icon: const Icon(Icons.password),
                  ),
                  const SizedBox(height: AppSize.size50),
                  BlocListener<AuthBloc, AuthState>(
                    listenWhen: (AuthState previous, AuthState current) =>
                        previous.formState != current.formState,
                    listener: (_, AuthState state) {
                      final AuthFormState authFormState = bloc.state.formState;
                      if (authFormState is SuccessFormState) {
                        bloc.add(
                          const NavigateToHomeScreenEvent(),
                        );
                      }
                      if (authFormState is FailedFormState) {
                        final SnackBar snackBar = SnackBar(
                          content: Text(
                            authFormState.exception.toString(),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: AuthButton(
                      width: AppSize.size150,
                      height: AppSize.size50,
                      buttonText: AppString.signUp,
                      textStyle: AppTextTheme.font22WhiteBold,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          bloc.add(
                            SignUpEvent(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              name: nameController.text.trim(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: AppSize.size25),
                  OfferAnotherScreen(
                    question: AppString.alreadyHaveAnAccount,
                    buttonText: AppString.signIn,
                    onPressed: () {
                      bloc.add(
                        const NavigateToSignInScreenEvent(),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
