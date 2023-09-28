import 'package:equatable/equatable.dart';

class ProductCategory extends Equatable {
  final int id;
  final String name;

  const ProductCategory({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
