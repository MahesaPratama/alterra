import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/data/models/api/product_model.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  group('Product Model Test', () {
    const productModel = ProductModel(
      id: 228,
      name: 'Chitato',
      imageUrl: 'images/products/41491e06-95af-46de-a3c9-634c54e1cd42.jpeg',
      description: 'makanan ringan cemilan',
      price: 2000,
      status: true,
    );

    dynamic response = json.decode(fixture('product_model.json'));
    final fromJson = ProductModel.fromJson(response);
    final toEntity = productModel.toEntity();

    test('should have correct parameters', () {
      expect(productModel.id, isA<int>());
      expect(productModel.name, isA<String>());
      expect(productModel.imageUrl, isA<String>());
      expect(productModel.description, isA<String>());
      expect(productModel.price, isA<num>());
      expect(productModel.status, isA<bool>());
    });

    test('should have return valid model from json', () {
      expect(fromJson.id, response['id']);
      expect(fromJson.name, response['name']);
      expect(fromJson.imageUrl, response['image_url']);
      expect(fromJson.description, response['description']);
      expect(fromJson.price, response['price']);
      expect(fromJson.status, response['status']);
    });

    test('should have return valid model to entity', () {
      final formatImage =
          "http://128.199.206.32:8000/api/v1/${productModel.imageUrl}";

      expect(productModel.id, toEntity.id);
      expect(productModel.name, toEntity.name);
      expect(toEntity.image, formatImage);
      expect(productModel.description, toEntity.description);
      expect(productModel.price, toEntity.price);
      expect(productModel.status, toEntity.status);
    });

    test("should extends equatable", () {
      expect(productModel.props, productModel.props);
    });
  });
}
