import 'package:domain/domain.dart';

class SignInUseCase extends FutureUseCase<User, NoParams> {
  final AuthRepository _authRepository;

  SignInUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<User> execute(NoParams params) {
    return _authRepository.signInUsingGoogleAcc();
  }
}
