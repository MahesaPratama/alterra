import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String image;
  final String description;
  final num price;
  final bool status;

  const Product({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        description,
        price,
        status,
      ];
}
