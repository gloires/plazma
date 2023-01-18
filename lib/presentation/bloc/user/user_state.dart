part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserEmptyState extends UserState {}

class UserLoadedState extends UserState {
  final UserEntity user;

  const UserLoadedState({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

class UserEditedState extends UserState {}
