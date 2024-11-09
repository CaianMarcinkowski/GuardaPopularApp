import 'package:flutter/material.dart';
import 'package:guarda_popular/pages/music_detail_page.dart';
import 'package:guarda_popular/models/music_item_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<MusicListItem> musics = [
    MusicListItem(
      imageUrl: 'assets/images/camisa_vermelha.png',
      title: 'Camisa vermelha',
      lyrics:
          'Inter, estaremos contigo \nTu és minha paixão! \nNão importa o que digam \nSempre levarei comigo \nMinha camisa vermelha \nE a cachaça na mãos\n O Gigante me espera\n Para começar a festa!\n Xalaialaiaa\n Xalaialaiaa\n Xalaialaiaa!\n Você me deixa doidão!\n Xalaialaiaa\n Xalaialaiaa\n Xalaialaiaa!\n Inter do meu coração!\n Xalaialaiaa\n Xalaialaiaa\n Xalaialaiaa!',
      duration: const Duration(minutes: 3, seconds: 46),
      videoUrl: 'assets/videos/camisa_vermelha.mp4',
      author: 'Endrigo Giacomin',
    ),
    MusicListItem(
      imageUrl: 'assets/images/inter_querido.png',
      title: 'Inter querido',
      lyrics: 'Inter \nInter querido \nPra cima deles \nPopular está contigo',
      duration: const Duration(minutes: 1, seconds: 15),
      videoUrl: 'assets/videos/inter_querido.mp4',
      author: 'Guarda Popular',
    ),
    MusicListItem(
      imageUrl: 'assets/images/sempre_louco_atras_do_gol.png',
      title: 'Sempre louco atras do gol',
      lyrics:
          'Sempre louco atras do gol acedendo um do bom \nEU VOU ... MATAR UM PUTO TRICOLOR \nE depois de me chapar e a cerveja acabar \nEU VOU ... MATAR UM PUTO TRICOLOR \nVamo inter hoje temos que vencer \nVamo inter hoje temos que vencer \nDale dale dale ôôô',
      duration: const Duration(minutes: 2, seconds: 23),
      videoUrl: 'assets/videos/sempre_louco_atras_do_gol.mp4',
      author: 'Guarda Popular',
    ),
    MusicListItem(
      imageUrl: 'assets/images/gp_04.jpg',
      title: 'Nada vai nos separar',
      lyrics: 'Album 1',
      duration: Duration(minutes: 3),
      videoUrl: '/assets/videos/camisa_vermelha.mp4',
      author: 'Guarda Popular',
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
                        lyric: music.lyrics,
                        videoUrl: music.videoUrl,
                        duration: music.duration,
                        author: music.author,
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
                  author: music.author,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
