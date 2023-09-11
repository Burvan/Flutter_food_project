import 'package:domain/domain.dart';

class SignOutUseCase extends FutureUseCase<void, NoParams> {
  final AuthRepository _authRepository;

  SignOutUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(NoParams params) {
    return _authRepository.signOut();
  }
}
