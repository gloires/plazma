import 'package:plazma/domain/entities/collection_entity.dart';
import 'package:plazma/domain/repositories/collections_repository.dart';

class UpdateCollection {
  final CollectionsRepository collectionsRepository;

  UpdateCollection({required this.collectionsRepository});

  Future<void> call({
    required int id,
    required String name,
    required String description,
    required String logoPath,
    required int private,
  }) async {
    await collectionsRepository.update(
      id,
      name,
      description,
      logoPath,
      private,
    );
  }
}
