part of 'collections_bloc.dart';

abstract class CollectionsEvent extends Equatable {
  const CollectionsEvent();

  @override
  List<Object> get props => [];
}

class CollectionsGetListEvent extends CollectionsEvent {}

class CollectionsGetEvent extends CollectionsEvent {
  final int id;
  final bool edit;

  const CollectionsGetEvent({
    required this.id,
    required this.edit,
  });

  @override
  List<Object> get props => [
        id,
        edit,
      ];
}

class CollectionsAddEvent extends CollectionsEvent {
  final String name;
  final String description;
  final int private;
  final String logoPath;

  const CollectionsAddEvent({
    required this.name,
    required this.description,
    required this.private,
    required this.logoPath,
  });

  @override
  List<Object> get props => [
        name,
        description,
        private,
      ];
}

class CollectionsEditEvent extends CollectionsEvent {
  final int id;
  final String name;
  final String description;
  final String logoPath;
  final int private;

  const CollectionsEditEvent({
    required this.id,
    required this.name,
    required this.description,
    required this.logoPath,
    required this.private,
  });

  @override
  List<Object> get props => [
        id,
        name,
        description,
        logoPath,
        private,
      ];
}

class CollectionsDeleteEvent extends CollectionsEvent {
  final int id;

  const CollectionsDeleteEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
