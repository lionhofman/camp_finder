import 'package:camp_finder/app/domain/entities/camping.dart';

class CampingResponse extends Camping {
  CampingResponse({
    required super.image,
    required super.name,
    required super.position,
  });

  factory CampingResponse.fromFirestore(Map<String, dynamic> data) {
    return CampingResponse(
      image: data['image'] ?? '',
      name: data['name'] ?? '',
      position: data['position'] != null
          ? Map<String, double>.from(data['position'])
          : Map<String, double>(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "image": image,
      "name": name,
      "position": position,
    };
  }
}
