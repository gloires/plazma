import 'package:plazma/domain/repositories/user_repository.dart';

class InitialUser {
  final UserRepository userRepository;

  InitialUser({required this.userRepository});

  Future<int> call() async {
    return await userRepository.initial();
  }
}