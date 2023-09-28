import 'package:equatable/equatable.dart';

class ProductCheckout extends Equatable {
  final int productId;
  final String name;
  final String image;
  final num price;
  final int quantity;
  final num totalPrice;
  final String notes;

  const ProductCheckout({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.totalPrice,
    required this.notes,
  });

  ProductCheckout copyWith({
    int? quantity,
    num? totalPrice,
    String? notes,
  }) {
    return ProductCheckout(
      productId: productId,
      name: name,
      image: image,
      price: price,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object> get props => [
        productId,
        name,
        image,
        price,
        quantity,
        totalPrice,
        notes,
      ];
}
