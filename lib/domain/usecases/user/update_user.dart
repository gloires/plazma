import 'package:plazma/domain/entities/user_entity.dart';
import 'package:plazma/domain/repositories/user_repository.dart';

class UpdateUser {
  final UserRepository userRepository;

  UpdateUser({required this.userRepository});

  Future<void> call(UserEntity user) async {
    await userRepository.update(user);
  }
}