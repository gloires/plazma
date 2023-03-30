import 'package:plazma/data/collections/collections_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class CollectionsDatasource {
  Future<List<CollectionsModel>> getCollections();

  Future<CollectionsModel> getCollection(int collectionID);

  Future<void> add(
    String name,
    String description,
    int private,
    String logoPath,
  );

  Future<void> delete(int collectionID);

  Future<void> update(
    int id,
    String name,
    String description,
    String logoPath,
    int private,
  );
}

class CollectionsDatasourceImpl implements CollectionsDatasource {
  final Database database;

  CollectionsDatasourceImpl({required this.database});

  @override
  Future<List<CollectionsModel>> getCollections() async {
    List<CollectionsModel> result = [];

    List<Map> list = await database.rawQuery("""
      SELECT
        collections.id, collections.title, collections.description, collections.logo_path, collections.private
      FROM
        collections
      ORDER BY
        collections.id DESC
      """);

    for (final item in list) {
      final collection = CollectionsModel(
        id: item["id"] ?? 0,
        title: item["title"] ?? "",
        description: item["description"] ?? "",
        logoPath: item["logo_path"] ?? "",
        count: 0,
        //TODO: count items in collections
        private: item["private"] ?? 0,
      );
      result.add(collection);
    }
    return result;
  }


  @override
  Future<CollectionsModel> getCollection(int collectionID) async {
    List<CollectionsModel> result = [];

    List<Map> list = await database.rawQuery("""
      SELECT
        collections.id, collections.title, collections.description, collections.logo_path, collections.private
      FROM
        collections
      WHERE
        collections.id = ?
      """, [collectionID]);

    for (final item in list) {
      final collection = CollectionsModel(
        id: item["id"] ?? 0,
        title: item["title"] ?? "",
        description: item["description"] ?? "",
        logoPath: item["logo_path"] ?? "",
        count: 0,
        //TODO: count items in collections
        private: item["private"] ?? 0,
      );
      result.add(collection);
    }
    return result.first;
  }

  @override
  Future<void> add(
    String name,
    String description,
    int private,
    String logoPath,
  ) async {
    await database.rawInsert(
      '''
          INSERT INTO collections(title, description, private, logo_path)
          VALUES(?, ?, ?, ?)
      ''',
      [name, description, private, logoPath],
    );
  }

  @override
  Future<void> delete(int collectionID) async {
    await database.rawQuery(
      """
      DELETE FROM
        collections
      WHERE
        id = ?
      """,
      [collectionID],
    );
  }

  @override
  Future<void> update(
    int id,
    String name,
    String description,
    String logoPath,
    int private,
  ) async {
    await database.rawUpdate('''
        UPDATE
          collections
        SET
          title = ?,
          description = ?,
          logo_path = ?,
          private = ?
        WHERE
          id = ?
      ''', [
      name,
      description,
      logoPath,
      private,
      id,
    ]);
  }
}
