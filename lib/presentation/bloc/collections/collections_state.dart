part of 'collections_bloc.dart';

abstract class CollectionsState extends Equatable {
  const CollectionsState();

  @override
  List<Object> get props => [];
}

class CollectionsEmptyState extends CollectionsState {}

class CollectionsListLoadedState extends CollectionsState {
  final List<CollectionEntity> collections;

  const CollectionsListLoadedState({
    required this.collections,
  });

  @override
  List<Object> get props => [collections];
}
