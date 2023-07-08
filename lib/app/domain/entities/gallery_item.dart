// ignore_for_file: public_member_api_docs, sort_constructors_first
class GalleryItem {
  final String type;
  final String? url;
  final MediaType? mediaType;

  GalleryItem({
    required this.type,
    this.url,
    this.mediaType,
  });
}

enum MediaType { photo, video }
