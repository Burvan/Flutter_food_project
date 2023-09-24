import 'package:domain/domain.dart';

class GoogleSignInUseCase extends FutureUseCase<AppUser, NoParams> {
  final AuthRepository _authRepository;

  GoogleSignInUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<AppUser> execute(NoParams params) {
    return _authRepository.googleSignIn();
  }
}
