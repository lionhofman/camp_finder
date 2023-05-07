import 'package:camp_finder/app/domain/entities/customer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomerResponse extends Customer {
  CustomerResponse({
    required super.code,
    required super.name,
    required super.email,
    super.password,
  });

  factory CustomerResponse.fromFirestore(User? data) {
    return CustomerResponse(
      code: data!.uid,
      name: data.displayName!,
      email: data.email!,
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
