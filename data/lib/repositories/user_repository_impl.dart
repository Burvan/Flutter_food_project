import 'package:data/data.dart';
import 'package:data/entities/user/user_entity.dart';
import 'package:data/mappers/mappers.dart';
import 'package:domain/domain.dart';

class UserRepositoryImpl implements UserRepository {
  final HiveProvider _hiveProvider;

  const UserRepositoryImpl({
    required HiveProvider hiveProvider,
  }) : _hiveProvider = hiveProvider;

  @override
  Future<AppUser> getStoredUser() async {
    final UserEntity userEntity = await _hiveProvider.getUser();
    return UserMapper.fromEntity(userEntity);
  }


}
