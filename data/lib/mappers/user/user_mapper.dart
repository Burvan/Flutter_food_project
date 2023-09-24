part of mappers;

class UserMapper extends Mapper<UserEntity, AppUser> {
  @override
  AppUser fromEntity(UserEntity entity) {
    return AppUser(
      id: entity.id,
      name: entity.name,
      email: entity.email,
    );
  }

  @override
  UserEntity toEntity(AppUser item) {
    return UserEntity(
      id: item.id,
      name: item.name,
      email: item.email,
    );
  }
}
