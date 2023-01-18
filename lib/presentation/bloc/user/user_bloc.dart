import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plazma/domain/entities/user_entity.dart';
import 'package:plazma/domain/usecases/user/get_user.dart';
import 'package:plazma/domain/usecases/user/initial_user.dart';
import 'package:plazma/domain/usecases/user/update_user.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final InitialUser initialUser;
  final GetUser getUser;
  final UpdateUser updateUser;

  UserEntity user = UserEntity.empty();

  UserBloc({
    required this.initialUser,
    required this.getUser,
    required this.updateUser,
  }) : super(UserEmptyState()) {
    on<UserInitialEvent>(_onUserInitialEvent);
    on<UserGetEvent>(_onUserGetEvent);
    on<UserEditEvent>(_onUserEditEvent);
  }

  @override
  Future<void> close() async {
    super.close();
  }

  FutureOr<void> _onUserInitialEvent(
      UserInitialEvent event,
      Emitter<UserState> emit,
      ) async {
    await initialUser();
    emit(UserLoadedState(user: user));
  }

  FutureOr<void> _onUserGetEvent(
    UserGetEvent event,
    Emitter<UserState> emit,
  ) async {
    user = await getUser();
    emit(UserLoadedState(user: user));
  }

  FutureOr<void> _onUserEditEvent(
    UserEditEvent event,
    Emitter<UserState> emit,
  ) async {
    final userEdited = UserEntity(
      name: event.name ?? user.name,
      imagePath: event.imagePath ?? user.imagePath,
    );
    updateUser(userEdited);
    emit(UserEditedState());
  }
}
