import 'package:data/data.dart';
import 'package:data/entities/user/user_entity.dart';
import 'package:data/mappers/mappers.dart';
import 'package:data/providers/auth_provider.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  final HiveProvider _hiveProvider;
  final AuthProvider _authProvider;

  const AuthRepositoryImpl({
    required HiveProvider hiveProvider,
    required AuthProvider authProvider,
  })  : _hiveProvider = hiveProvider,
        _authProvider = authProvider;

  @override
  Future<AppUser> signIn({
    required String email,
    required String password,
  }) async {
    final UserEntity userEntity = await _authProvider.signIn(
      email: email,
      password: password,
    );
    final AppUser user = UserMapper.fromEntity(userEntity);
    await _hiveProvider.saveUser(user);
    return user;
  }

  @override
  Future<AppUser> googleSignIn() async {
    final UserEntity userEntity = await _authProvider.googleSignIn();
    final AppUser user = UserMapper.fromEntity(userEntity);
    await _hiveProvider.saveUser(user);
    return user;
  }

  @override
  Future<void> signOut() async {
    await _authProvider.signOut();
    await _hiveProvider.deleteUser();
  }

  @override
  Future<AppUser> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final UserEntity userEntity = await _authProvider.signUp(
      name: name,
      email: email,
      password: password,
    );
    final AppUser user = UserMapper.fromEntity(userEntity);
    await _hiveProvider.saveUser(user);
    return user;
  }
}
