import 'package:domain/domain.dart';

class GetStoredUserUseCase extends FutureUseCase<AppUser, NoParams> {
  final AuthRepository _authRepository;

  GetStoredUserUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<AppUser> execute(NoParams params) async {
    return _authRepository.getStoredUser();
  }


}
