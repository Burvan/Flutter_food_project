import 'package:core/core.dart';
import 'package:domain/domain.dart';

class SignInUseCase extends FutureUseCase<AppUser, SignInParams> {
  final AuthRepository _authRepository;

  SignInUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<AppUser> execute(SignInParams params) {
    return _authRepository.signIn(
      email: params.email,
      password: params.password,
    );
  }
}
