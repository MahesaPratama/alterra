import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/data/models/api/category_model.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  group('Category Model Test', () {
    const categoryModel = CategoryModel(
      id: 1,
      name: 'Category 1',
    );

    dynamic response = json.decode(fixture('category_model.json'));
    final fromJson = CategoryModel.fromJson(response);
    final toEntity = categoryModel.toEntity();
    test('should have correct parameters', () {
      expect(categoryModel.id, isA<int>());
      expect(categoryModel.name, isA<String>());
    });

    test('should have return valid model from json', () {
      expect(fromJson.id, response['id']);
      expect(fromJson.name, response['name']);
    });

    test('should have return valid model to entity', () {
      expect(categoryModel.id, toEntity.id);
      expect(categoryModel.name, toEntity.name);
    });

    test("should extends equatable", () {
      expect(categoryModel.props, categoryModel.props);
    });
  });
}
