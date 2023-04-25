class Camping {
  final int code;
  final String title;
  final String nameCamping;
  final String about;
  final String? phone;
  final String type;
  final String? trekkingDescription;
  final String services;
  final String address;
  final String? website;
  final String? instagram;
  final String? whatsapp;
  final DateTime updateDate;
  final String image;
  Map<String, dynamic> position;

  Camping({
    required this.code,
    required this.title,
    required this.nameCamping,
    required this.about,
    this.phone,
    required this.type,
    this.trekkingDescription,
    required this.services,
    required this.address,
    this.website,
    this.instagram,
    required this.whatsapp,
    required this.updateDate,
    required this.image,
    required this.position,
  });
}
