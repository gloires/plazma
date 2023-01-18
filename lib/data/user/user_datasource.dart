import 'package:plazma/data/user/user_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class UserDatasource {
  Future<int> initial();

  Future<UserModel> getUserInformation();

  Future<void> update(UserModel user);
}

class UserDatasourceImpl implements UserDatasource {
  final Database database;

  UserDatasourceImpl({required this.database});

  @override
  Future<int> initial() async {
    return await database.rawInsert(
      """
    INSERT INTO 
      user(name, image_path)
    VALUES(?,?)
    """,
      [
        "User",
        "assets/images/avatar.png",
      ],
    );
  }

  @override
  Future<UserModel> getUserInformation() async {
    List<UserModel> result = [];

    List<Map> list = await database.rawQuery("""
    SELECT 
      id, name, image_path
    FROM
      user
    """);

    for (final item in list) {
      final user = UserModel(
        id: item["id"] ?? 0,
        name: item["name"] ?? "",
        imagePath: item["image_path"] ?? "",
      );
      result.add(user);
    }
    return result.first;
  }

  @override
  Future<void> update(UserModel user) async {
    await database.rawUpdate('''
        UPDATE
          user
        SET
          name = ?,
          image_path = ?
        WHERE
          id = ?
      ''', [
      user.name,
      user.imagePath,
      user.id,
    ]);
  }
}
