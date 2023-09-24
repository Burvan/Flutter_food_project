import 'package:domain/domain.dart';

abstract class AuthRepository {
  Future<AppUser> signIn({
    required String email,
    required String password,
  });

  Future<AppUser> signInUsingGoogleAcc();

  Future<AppUser> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<AppUser> getStoredUser();
}
