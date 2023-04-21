import 'package:camp_finder/app/domain/entities/customer.dart';

class CustomerResponse extends Customer {
  CustomerResponse({
    required super.code,
    required super.name,
    required super.email,
    required super.password,
  });

  factory CustomerResponse.fromFirestore(Map<String, dynamic> data) {
    return CustomerResponse(
      code: data['code'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      password: data['password'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "code": code,
      "name": name,
      "email": email,
      "password": password,
    };
  }
}
