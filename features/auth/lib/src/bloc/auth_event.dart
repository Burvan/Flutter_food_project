part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class InitAuthEvent extends AuthEvent {
  const InitAuthEvent();
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({
    required this.email,
    required this.password,
  });
}

class SignInUsingGoogleAccEvent extends AuthEvent {
  const SignInUsingGoogleAccEvent();
}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignUpEvent({
    required this.email,
    required this.password,
    required this.name,
  });
}

class SignOutEvent extends AuthEvent {
  const SignOutEvent();
}

class NavigateToHomeScreenEvent extends AuthEvent {
  const NavigateToHomeScreenEvent();
}

class NavigateToSignInScreenEvent extends AuthEvent {
  const NavigateToSignInScreenEvent();
}
