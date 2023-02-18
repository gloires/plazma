import 'package:plazma/domain/repositories/collections_repository.dart';

class DeleteCollection {
  final CollectionsRepository collectionsRepository;

  DeleteCollection({required this.collectionsRepository});

  Future<void> call(int collectionID) async {
    await collectionsRepository.delete(collectionID);
  }
}
