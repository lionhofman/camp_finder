import 'package:camp_finder/app/domain/entities/additional_info.dart';
import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:camp_finder/app/domain/entities/gallery_item.dart';
import 'package:camp_finder/app/domain/entities/open_hour.dart';
import 'package:get/get.dart';

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
    required super.openHours,
    required super.gallery,
    required super.additionalInfo,
  });
  factory CampingResponse.fromFirestore(Map<String, dynamic> data) {
    String nameCamping = data['name_camping'];
    if (nameCamping.isNotEmpty) {
      nameCamping = nameCamping.capitalize!;
    }

    String title = data['title'];
    if (title.isNotEmpty) {
      title = title.capitalize!;
    }

    //OpenHours
    List<OpenHour> openHoursList = <OpenHour>[];
    if (data['open_hours'] != null) {
      openHoursList = data['open_hours'] as List<OpenHour>;
    }
    //Gallery
    List<GalleryItem> galleryList = <GalleryItem>[];
    if (data['gallery'] != null) {
      galleryList = data['gallery'] as List<GalleryItem>;
    }
    //AdditionalInfo
    List<AdditionalInfo> additionalInfoList = <AdditionalInfo>[];
    if (data['additional_info'] != null) {
      additionalInfoList = data['additional_info'] as List<AdditionalInfo>;
    }
    return CampingResponse(
      code: data['code'],
      nameCamping: nameCamping,
      title: title,
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
      additionalInfo: additionalInfoList,
      gallery: galleryList,
      openHours: openHoursList,
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
