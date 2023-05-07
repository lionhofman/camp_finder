import 'package:hive/hive.dart';
part 'customer.g.dart';

@HiveType(typeId: 0)
class Customer {
  @HiveField(0)
  final String code;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String? password;

  Customer({
    required this.code,
    required this.name,
    required this.email,
    this.password,
  });
}
