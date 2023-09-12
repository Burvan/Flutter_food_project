import 'package:domain/domain.dart';

class SignInUsingGoogleAccUseCase extends FutureUseCase<User, NoParams> {
  final AuthRepository _authRepository;

  SignInUsingGoogleAccUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<User> execute(NoParams params) {
    return _authRepository.signInUsingGoogleAcc();
  }
}
