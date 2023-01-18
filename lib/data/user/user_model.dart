import 'package:plazma/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required int id,
    required String name,
    required String imagePath,
  }) : super(
          id: id,
          name: name,
          imagePath: imagePath,
        );

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      id: user.id,
      name: user.name,
      imagePath: user.imagePath,
    );
  }
}
