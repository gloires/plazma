import 'package:plazma/data/collections/collections_datasource.dart';
import 'package:plazma/domain/entities/collection_entity.dart';
import 'package:plazma/domain/repositories/collections_repository.dart';

class CollectionsRepositoryImpl implements CollectionsRepository {
  final CollectionsDatasource collectionsDatasource;

  CollectionsRepositoryImpl({
    required this.collectionsDatasource,
  });

  @override
  Future<List<CollectionEntity>> getCollections() async {
    return await collectionsDatasource.getCollections();
  }

  @override
  Future<void> add(
    String name,
    String description,
    int private,
    String logoPath,
  ) async {
    await collectionsDatasource.add(
      name,
      description,
      private,
      logoPath,
    );
  }

  @override
  Future<void> delete(int collectionID) async {
    await collectionsDatasource.delete(collectionID);
  }

  @override
  Future<void> update(
    int id,
    String name,
    String description,
    String logoPath,
    int private,
  ) async {
    await collectionsDatasource.update(
      id,
      name,
      description,
      logoPath,
      private,
    );
  }

  @override
  Future<CollectionEntity> getCollection(int collectionID) async {
    return await collectionsDatasource.getCollection(collectionID);
  }
}
