import 'package:core/core.dart';
import 'package:domain/domain.dart';

class SignUpUseCase extends FutureUseCase<User, SignUpParams> {
  final AuthRepository _authRepository;

  SignUpUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<User> execute(SignUpParams params) {
    return _authRepository.signUp(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}
