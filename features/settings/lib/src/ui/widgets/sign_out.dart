import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class SignOut extends StatelessWidget {
  const SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc bloc = BlocProvider.of<AuthBloc>(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (_, AuthState state) {
        return Align(
          alignment: Alignment.topLeft,
          child: ElevatedButton(
            onPressed: () {
              bloc.add(
                const SignOutEvent(),
              );
              bloc.add(
                const NavigateToSignInScreenEvent(),
              );
            },
            style: ButtonStyle(
              padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(
                  vertical: AppPadding.padding10,
                  horizontal: AppPadding.padding25,
                ),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppBorderRadius.borderRadius18,
                  ),
                ),
              ),
            ),
            child: Text(
              '${AppString.signOut} ${state.user.name}',
              style: AppTextTheme.font18Bold,
            ),
          ),
        );
      },
    );
  }
}
