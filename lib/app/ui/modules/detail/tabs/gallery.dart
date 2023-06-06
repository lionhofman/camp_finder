import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Gallery extends StatelessWidget {
  final String imgUrl;
  Gallery({super.key, required this.imgUrl});

  final List<String> videoIds = [
    'v5mrdehPOEE',
    'QViR02CMU9Y',
    'v5mrdehPOEE',
  ];

  final List<Media> mediaList = [
    Media(
        type: MediaType.photo,
        url:
            'https://lh5.googleusercontent.com/p/AF1QipP7pI743huWwGuTibSIxDfxzDWRDAktochXzvb9=w426-h240-k-no'),
    Media(type: MediaType.video, url: 'v5mrdehPOEE'),
    Media(type: MediaType.video, url: 'QViR02CMU9Y'),
  ];

  void launchURL({String? url}) async {
    if (url != null) {
      Uri myUri = Uri.parse(url);
      await launchUrl(
        myUri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200, // Altura da galeria
        child: PageView.custom(
          physics: NeverScrollableScrollPhysics(),
          controller: PageController(viewportFraction: 0.8),
          childrenDelegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              if (mediaList[index].type == MediaType.photo) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      mediaList[index].url,
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
              } else if (mediaList[index].type == MediaType.video) {
                String? videoId =
                    YoutubePlayer.convertUrlToId(mediaList[index].url);
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
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                    ),
                  ),
                );
              }
              return Container(); // Retorna um container vazio se nenhum tipo correspondente for encontrado
            },
            childCount: mediaList.length,
          ),
        ),
      ),
    );
  }
}

class Media {
  final String url;
  final MediaType type;

  Media({required this.url, required this.type});
}

enum MediaType { photo, video }
