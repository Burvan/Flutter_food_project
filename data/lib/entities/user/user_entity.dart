import 'package:core/core.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 3)
class UserEntity {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
  });

  List<Object?> get props => <Object?>[
    id,
    name,
    email,
  ];

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
