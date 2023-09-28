import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/membership.dart';

void main() {
  group('Membership Entitiy Test', () {
    const membership = Membership(
      name: 'test',
      email: 'email@email.com',
      birthDay: '2023-12-20',
      phone: 123124,
    );

    test('should have correct parameters', () {
      expect(membership.name, isA<String>());
      expect(membership.email, isA<String>());
      expect(membership.birthDay, isA<String>());
      expect(membership.phone, isA<int>());
    });

    test("should extends equatable", () {
      expect(membership.props, membership.props);
    });
  });
}
