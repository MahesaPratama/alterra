import 'package:equatable/equatable.dart';

class Membership extends Equatable {
  final String name;
  final String email;
  final int phone;
  final String birthDay;

  const Membership({
    required this.name,
    required this.email,
    required this.phone,
    required this.birthDay,
  });

  @override
  List<Object?> get props => [name, email, phone, birthDay];
}
