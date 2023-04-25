import 'package:camp_finder/app/domain/entities/camping.dart';

class CampingResponse extends Camping {
  CampingResponse({
    required super.image,
    required super.position,
    required super.code,
    required super.title,
    required super.nameCamping,
    required super.about,
    required super.type,
    required super.services,
    required super.address,
    super.instagram,
    super.phone,
    super.trekkingDescription,
    super.website,
    super.whatsapp,
    required super.updateDate,
  });
  factory CampingResponse.fromFirestore(Map<String, dynamic> data) {
    return CampingResponse(
      code: data['code'],
      nameCamping: data['name_camping'] ?? '',
      title: data['title'] ?? '',
      image: data['image'] ?? '',
      position: data['position'] != null
          ? Map<String, dynamic>.from(data['position'])
          : Map<String, dynamic>(),
      about: data['about'] ?? '',
      address: data['address'] ?? '',
      services: data['services'] ?? '',
      type: data['type'] ?? '',
      whatsapp: data['whatsapp'],
      instagram: data['instagram'],
      phone: data['phone'],
      trekkingDescription: data['trekking'],
      website: data['website'],
      updateDate: data['updateDate'] ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "image": image,
      "name": nameCamping,
      "position": position,
    };
  }
}
