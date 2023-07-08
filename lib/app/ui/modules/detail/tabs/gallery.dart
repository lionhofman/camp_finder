// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:camp_finder/app/domain/entities/gallery_item.dart';

class Gallery extends StatelessWidget {
  final List<GalleryItem>? gallery;

  const Gallery({
    Key? key,
    this.gallery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: Get.height,
        child: ListView.builder(
          itemCount: gallery != null ? gallery!.length : 0,
          itemBuilder: (BuildContext context, int index) {
            if (gallery?[index].mediaType == MediaType.photo) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    gallery![index].url!,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Text('Erro ao carregar imagem');
                    },
                  ),
                ),
              );
            } else if (gallery?[index].mediaType == MediaType.video) {
              String? videoId =
                  YoutubePlayer.convertUrlToId(gallery![index].url!);
              if (videoId == null) {
                return const Text('Erro ao carregar vídeo');
              }
              YoutubePlayerController _controller = YoutubePlayerController(
                initialVideoId: videoId,
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                ),
              );
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
