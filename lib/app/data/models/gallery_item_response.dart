import 'package:camp_finder/app/domain/entities/gallery_item.dart';

class GalleryItemResponse extends GalleryItem {
  GalleryItemResponse({required super.type, super.url, super.mediaType});
  factory GalleryItemResponse.fromFirestore(Map<String, dynamic> data) {
    MediaType? mediaType;
    String? urlFormatted = data['url'];

    if (urlFormatted != null && urlFormatted.isNotEmpty) {
      mediaType =
          urlFormatted.contains('youtube') ? MediaType.video : MediaType.photo;
      if (mediaType == MediaType.video) {
        urlFormatted = extractVideoId(urlFormatted);
      }
    }

    return GalleryItemResponse(
      type: data['type'] ?? '',
      url: urlFormatted,
      mediaType: mediaType,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'type': type,
      'url': url,
    };
  }
}

String? extractVideoId(String urlParam) {
  final uri = Uri.parse(urlParam);
  final String? videoId = uri.queryParameters['v'];
  return videoId;
}
