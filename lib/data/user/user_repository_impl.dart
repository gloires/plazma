import 'package:plazma/data/user/user_datasource.dart';
import 'package:plazma/data/user/user_model.dart';
import 'package:plazma/domain/entities/user_entity.dart';
import 'package:plazma/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource userDatasource;

  UserRepositoryImpl({
    required this.userDatasource,
  });

  @override
  Future<UserEntity> getUserInformation() async {
    return await userDatasource.getUserInformation();
  }

  @override
  Future<void> update(UserEntity user) async {
    await userDatasource.update(UserModel.fromEntity(user));
  }
}
