import 'dart:ui';

import 'package:data/data.dart';
import 'package:data/entities/user/user_entity.dart';
import 'package:data/mappers/mappers.dart';
import 'package:data/providers/auth_provider.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  final MapperFactory mapper;
  final HiveProvider _hiveProvider;
  final AuthProvider _authProvider;

  const AuthRepositoryImpl({
    required this.mapper,
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
    final AppUser user = mapper.userMapper.fromEntity(userEntity);
    await _hiveProvider.saveUser(user);
    return user;
  }

  @override
  Future<AppUser> signInUsingGoogleAcc() async {
    final UserEntity userEntity = await _authProvider.signInUsingGoogleAcc();
    final AppUser user = mapper.userMapper.fromEntity(userEntity);
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
    final AppUser user = mapper.userMapper.fromEntity(userEntity);
    await _hiveProvider.saveUser(user);
    return user;
  }

  @override
  Future<AppUser> getStoredUser() async {
    final UserEntity userEntity = await _hiveProvider.getUser();
    return mapper.userMapper.fromEntity(userEntity);
  }
}
