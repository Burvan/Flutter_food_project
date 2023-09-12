part of mappers;

class UserMapper extends Mapper<UserEntity, domain.User> {
  @override
  domain.User fromEntity(UserEntity entity) {
    return domain.User(
      id: entity.id,
      name: entity.name,
      email: entity.email,
    );
  }

  @override
  UserEntity toEntity(domain.User item) {
    return UserEntity(
      id: item.id,
      name: item.name,
      email: item.email,
    );
  }
}
