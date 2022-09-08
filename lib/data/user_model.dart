import 'package:plazma/domain/entities/genre_entity.dart';

class UserModel extends GenreEntity {
  const UserModel ({
    required int id,
    required String name,
  }) : super(
    id: id,
    name: name,
  );

  factory UserModel.fr(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
    );
  }
}