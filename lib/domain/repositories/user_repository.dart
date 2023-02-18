import 'package:plazma/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUserInformation();
  Future<void> update(UserEntity user);
}