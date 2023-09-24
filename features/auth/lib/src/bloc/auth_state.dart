part of 'auth_bloc.dart';

class AuthState {
  final AppUser user;
  final bool isLogged;
  final AuthFormState formState;

  AuthState(
      {required this.user,
      required this.isLogged,
      required this.formState});

  AuthState.empty()
      : user = const AppUser(
          id: '',
          name: '',
          email: '',
        ),
        isLogged = false,
        formState = const InitFormState();

  AuthState copyWith({
    AppUser? user,
    bool? isLogged,
    AuthFormState? formState,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLogged: isLogged ?? this.isLogged,
      formState: formState ?? this.formState,
    );
  }
}
