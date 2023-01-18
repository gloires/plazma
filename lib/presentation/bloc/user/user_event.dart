part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserInitialEvent extends UserEvent {}

class UserGetEvent extends UserEvent {}

class UserEditEvent extends UserEvent {
  final String? name;
  final String? imagePath;

  const UserEditEvent({
    this.name,
    this.imagePath,
  });

  @override
  List<Object> get props => [];
}
