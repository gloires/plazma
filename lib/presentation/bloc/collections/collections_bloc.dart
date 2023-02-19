import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plazma/domain/entities/collection_entity.dart';
import 'package:plazma/domain/usecases/collections/add_collection.dart';
import 'package:plazma/domain/usecases/collections/delete_collection.dart';
import 'package:plazma/domain/usecases/collections/get_collection.dart';
import 'package:plazma/domain/usecases/collections/get_collections.dart';
import 'package:plazma/domain/usecases/collections/update_collection.dart';

part 'collections_event.dart';

part 'collections_state.dart';

class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  final GetCollections getCollections;
  final GetCollection getCollection;
  final AddCollection addCollection;
  final DeleteCollection deleteCollection;
  final UpdateCollection updateCollection;

  CollectionsBloc({
    required this.getCollections,
    required this.getCollection,
    required this.addCollection,
    required this.deleteCollection,
    required this.updateCollection,
  }) : super(CollectionsEmptyState()) {
    on<CollectionsGetListEvent>(_onCollectionsGetListEvent);
    on<CollectionsGetEvent>(_onCollectionsGetEvent);
    on<CollectionsAddEvent>(_onCollectionsAddEvent);
    on<CollectionsDeleteEvent>(_onCollectionsDeleteEvent);
    on<CollectionsEditEvent>(_onCollectionsEditEvent);
  }

  FutureOr<void> _onCollectionsGetListEvent(
    CollectionsGetListEvent event,
    Emitter<CollectionsState> emit,
  ) async {
    final collections = await getCollections();
    emit(CollectionsListLoadedState(collections: collections));
  }

  FutureOr<void> _onCollectionsGetEvent(
      CollectionsGetEvent event,
      Emitter<CollectionsState> emit,
      ) async {
    final collection = await getCollection(event.id);
    emit(CollectionsLoadedState(collection: collection));
  }

  FutureOr<void> _onCollectionsAddEvent(
    CollectionsAddEvent event,
    Emitter<CollectionsState> emit,
  ) async {
    await addCollection(
      name: event.name,
      description: event.description,
      private: event.private,
      logoPath: event.logoPath,
    );
    add(CollectionsGetListEvent());
  }

  FutureOr<void> _onCollectionsDeleteEvent(
    CollectionsDeleteEvent event,
    Emitter<CollectionsState> emit,
  ) async {
    await deleteCollection(event.id);
    add(CollectionsGetListEvent());
  }

  FutureOr<void> _onCollectionsEditEvent(
    CollectionsEditEvent event,
    Emitter<CollectionsState> emit,
  ) async {
    await updateCollection(
      id: event.id,
      name: event.name,
      description: event.description,
      logoPath: event.logoPath,
      private: event.private,
    );
    add(CollectionsGetListEvent());
  }
}
