import 'package:plazma/domain/entities/collection_entity.dart';
import 'package:plazma/domain/repositories/collections_repository.dart';

class GetCollection {
  final CollectionsRepository collectionsRepository;

  GetCollection({required this.collectionsRepository});

  Future<CollectionEntity> call(int collectionID) async {
    return await collectionsRepository.getCollection(collectionID);
  }
}