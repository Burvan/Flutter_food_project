import 'package:domain/domain.dart';

class GetStoredUserUseCase extends FutureUseCase<AppUser, NoParams> {
  final UserRepository _userRepository;

  GetStoredUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<AppUser> execute(NoParams params) {
    return _userRepository.getStoredUser();
  }


}
