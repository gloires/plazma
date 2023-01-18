import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String imagePath;

  const UserEntity({
    this.id = 1,
    required this.name,
    required this.imagePath,
  });

  factory UserEntity.empty() {
    return const UserEntity(
      name: "User",
      imagePath: "assets/images/avatar.png",
    );
  }

  bool isEmpty() {
    return name.isEmpty;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        imagePath,
      ];
}
