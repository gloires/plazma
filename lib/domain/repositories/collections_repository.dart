import 'package:plazma/domain/entities/collection_entity.dart';

abstract class CollectionsRepository {
  Future<List<CollectionEntity>> getCollections();

  Future<void> add(
    String name,
    String description,
    bool private,
    String logoPath,
  );

  Future<void> delete(int collectionID);

  Future<void> update(
    int id,
    String name,
    String description,
    String logoPath,
    bool private,
  );
}
