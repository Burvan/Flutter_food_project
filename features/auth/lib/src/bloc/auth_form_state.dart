abstract class AuthFormState {
  const AuthFormState();
}

class InitFormState extends AuthFormState {
  const InitFormState();
}

class SuccessFormState extends AuthFormState {
  const SuccessFormState();
}

class FailedFormState extends AuthFormState {
  final String? exception;
  
  FailedFormState(this.exception);
}
