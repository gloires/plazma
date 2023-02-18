import 'package:plazma/domain/repositories/collections_repository.dart';

class AddCollection {
  final CollectionsRepository collectionsRepository;

  AddCollection({required this.collectionsRepository});

  Future<void> call({
    required String name,
    required String description,
    required bool private,
    required String logoPath,
  }) async {
    await collectionsRepository.add(
      name,
      description,
      private,
      logoPath,
    );
  }
}
