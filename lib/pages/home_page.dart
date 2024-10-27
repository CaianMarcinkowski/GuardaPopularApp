import 'package:flutter/material.dart';
import 'package:guarda_popular/pages/music_detail_page.dart';
import 'package:guarda_popular/models/music_item_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<MusicListItem> musics = [
    MusicListItem(
      imageUrl: 'assets/images/camisa_vermelha.png',
      title: 'Camisa vermelha',
      lyrics: 'Album 1',
      duration: Duration(minutes: 3, seconds: 15),
      videoUrl: 'assets/videos/camisa_vermelha.mp4',
    ),
    MusicListItem(
      imageUrl: 'assets/images/gp_02.jpg',
      title: 'Inter querido',
      lyrics: 'Album 1',
      duration: Duration(minutes: 3),
      videoUrl: '/assets/videos/camisa_vermelha.mp4',
    ),
    MusicListItem(
      imageUrl: 'assets/images/gp_03.jpg',
      title: 'Nada muda este sentimento',
      lyrics: 'Album 1',
      duration: Duration(minutes: 3),
      videoUrl: '/assets/videos/camisa_vermelha.mp4',
    ),
    MusicListItem(
      imageUrl: 'assets/images/gp_04.jpg',
      title: 'Nada vai nos separar',
      lyrics: 'Album 1',
      duration: Duration(minutes: 3),
      videoUrl: '/assets/videos/camisa_vermelha.mp4',
    ),

    // Adicione mais músicas conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          'O maior do sul',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (final music in musics)
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MusicDetailPage(
                        title: music.title,
                        image: music.imageUrl,
                        videoUrl: music.videoUrl,
                        duration: music.duration,
                      ),
                    ),
                  );
                },
                child: MusicListItem(
                  imageUrl: music.imageUrl,
                  title: music.title,
                  lyrics: music.lyrics,
                  duration: music.duration,
                  videoUrl: music.videoUrl,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
