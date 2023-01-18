import 'package:plazma/domain/entities/user_entity.dart';
import 'package:plazma/domain/repositories/user_repository.dart';

class GetUser {
  final UserRepository userRepository;

  GetUser({required this.userRepository});

  Future<UserEntity> call() async {
    return await userRepository.getUserInformation();
  }
}