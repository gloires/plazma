import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String image;
  final String name;

  const UserEntity({
    required this.image,
    required this.name,
  });

  @override
  List<Object?> get props => [image, name];
}
