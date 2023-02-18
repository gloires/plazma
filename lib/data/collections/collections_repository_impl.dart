import 'package:plazma/data/collections/collections_datasource.dart';
import 'package:plazma/data/collections/collections_model.dart';
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
  Future<void> add(String name, String description, bool private) async {
    int privateToInt = private ? 0 : 1;
    await collectionsDatasource.add(name, description, privateToInt);
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
    bool private,
  ) async {
    int privateToInt = private ? 0 : 1;
    await collectionsDatasource.update(
      id,
      name,
      description,
      logoPath,
      privateToInt,
    );
  }
}
