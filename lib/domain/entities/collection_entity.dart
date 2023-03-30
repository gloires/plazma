import 'package:equatable/equatable.dart';

class CollectionEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String logoPath;
  final int count;
  final int private;

  const CollectionEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.logoPath,
    required this.count,
    required this.private,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    logoPath,
    count,
    private
  ];
}
