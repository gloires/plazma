import 'package:plazma/domain/entities/collection_entity.dart';

class CollectionsModel extends CollectionEntity {
  const CollectionsModel({
    required int id,
    required String title,
    required String description,
    required String logoPath,
    required int count,
    required int private,
  }) : super(
          id: id,
          title: title,
          description: description,
          logoPath: logoPath,
          count: count,
          private: private == 0 ? true : false,
        );

  factory CollectionsModel.fromEntity(CollectionEntity collection) {
    return CollectionsModel(
      id: collection.id,
      title: collection.title,
      description: collection.description,
      logoPath: collection.logoPath,
      count: collection.count,
      private: collection.private ? 0 : 1,
    );
  }

  factory CollectionsModel.empty() {
    return const CollectionsModel(
      id: 0,
      title: "",
      description: "",
      logoPath: "",
      count: 0,
      private: 0,
    );
  }
}
