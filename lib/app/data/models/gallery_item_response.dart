import 'package:camp_finder/app/domain/entities/gallery_item.dart';

class GalleryItemResponse extends GalleryItem {
  GalleryItemResponse({required super.type, required super.url});
  factory GalleryItemResponse.fromFirestore(Map<String, dynamic> data) {
    return GalleryItemResponse(
      type: data['type'] ?? '',
      url: data['url'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'type': type,
      'url': url,
    };
  }
}
