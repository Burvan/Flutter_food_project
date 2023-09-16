import 'package:core/core.dart';
import 'package:domain/domain.dart';

class SignUpUseCase extends FutureUseCase<AppUser, SignUpParams> {
  final AuthRepository _authRepository;

  SignUpUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<AppUser> execute(SignUpParams params) async {
    return _authRepository.signUp(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}
