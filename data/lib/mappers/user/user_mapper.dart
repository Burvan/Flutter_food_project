part of mappers;

abstract class UserMapper {
  static UserEntity toEntity(AppUser user) {
    return UserEntity(
      id: user.id,
      email: user.email,
      name: user.name,
    );
  }

  static AppUser fromEntity(UserEntity entity) {
    return AppUser(
      id: entity.id,
      email: entity.email,
      name: entity.name,
    );
  }
}
