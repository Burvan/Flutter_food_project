import 'package:domain/domain.dart';

abstract class AuthRepository {
  Future<User> signIn({
    required String email,
    required String password,
  });

  Future<User> signInUsingGoogleAcc();

  Future<User> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<void> signOut();
}
