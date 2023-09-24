import 'package:auth/auth.dart';
import 'package:auth/src/ui/widgets/app_text_field.dart';
import 'package:auth/src/ui/widgets/auth_button.dart';
import 'package:auth/src/ui/widgets/google_sign_in_button.dart';
import 'package:auth/src/ui/widgets/offer_another_screen.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthBloc bloc = BlocProvider.of<AuthBloc>(context);
    final Size size = MediaQuery.sizeOf(context);

    return Container(
      width: size.width / AppScale.scaleOne2,
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
            AppString.hello,
            style: AppTextTheme.font32Bold,
          ),
          const SizedBox(height: AppSize.size10),
          Text(
            AppString.pleaseLogin,
            style: AppTextTheme.font18.copyWith(
              color: AppColors.lightGrey,
            ),
          ),
          const SizedBox(height: AppSize.size20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.padding20,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  AppTextField(
                    controller: emailController,
                    validator: (String? value) =>
                        FieldValidator.emailValidator(value),
                    labelText: AppString.emailAddress,
                    obscureText: false,
                    icon: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(height: AppSize.size20),
                  AppTextField(
                    controller: passwordController,
                    validator: (String? value) =>
                        FieldValidator.passwordValidator(value),
                    labelText: AppString.password,
                    obscureText: true,
                    icon: const Icon(Icons.password),
                  ),
                  const SizedBox(height: AppSize.size25),
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
                        buttonText: AppString.signIn,
                        textStyle: AppTextTheme.font22Bold.copyWith(
                          color: AppColors.white,
                        ),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            bloc.add(
                              SignInEvent(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                          }
                        }),
                  ),
                  const SizedBox(height: AppSize.size25),
                  const Text(
                    AppString.orSignInUsingGoogle,
                    style: AppTextTheme.font18Bold,
                  ),
                  GoogleSignInButton(
                    onTap: () => bloc.add(
                      const SignInUsingGoogleAccEvent(),
                    ),
                  ),
                  OfferAnotherScreen(
                    question: AppString.noAccount,
                    buttonText: AppString.signUp,
                    onPressed: () {
                      bloc.add(const NavigateToSignUpScreenEvent());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
