import 'package:domain/domain.dart';

class SignInUsingGoogleAccUseCase extends FutureUseCase<AppUser, NoParams> {
  final AuthRepository _authRepository;

  SignInUsingGoogleAccUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<AppUser> execute(NoParams params) async {
    return _authRepository.signInUsingGoogleAcc();
  }
}
