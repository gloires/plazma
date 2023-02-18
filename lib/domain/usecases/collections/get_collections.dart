import 'package:plazma/domain/entities/collection_entity.dart';
import 'package:plazma/domain/repositories/collections_repository.dart';

class GetCollections {
  final CollectionsRepository collectionsRepository;

  GetCollections({required this.collectionsRepository});

  Future<List<CollectionEntity>> call() async {
    return await collectionsRepository.getCollections();
  }
}