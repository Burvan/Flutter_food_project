import 'package:domain/domain.dart';

abstract class UserRepository {
  Future<AppUser> getStoredUser();
}