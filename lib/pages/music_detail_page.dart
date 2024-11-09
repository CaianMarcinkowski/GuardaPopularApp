import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MusicDetailPage extends StatefulWidget {
  const MusicDetailPage({
    super.key,
    required this.title,
    required this.image,
    required this.lyric,
    required this.videoUrl,
    required this.duration,
    required this.author,
  });

  final String title;
  final String image;
  final String lyric;
  final String videoUrl;
  final Duration duration;
  final String author;

  @override
  State<MusicDetailPage> createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  late VideoPlayerController _controller;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      }).catchError((error) {
        print('Erro: $error');
        setState(() {
          _isError = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          // Conteúdo rolável
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 250),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.timer),
                          const SizedBox(width: 10),
                          Text(
                            '${widget.duration.inMinutes} minutos e \n${(widget.duration.inSeconds % 60).toString().padLeft(2, '0')} segundos',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(width: 10),
                          Text(
                            widget.author,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    widget.lyric,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 230, // Altura do vídeo
              width: double.infinity,
              color: Colors.black, // Cor de fundo do vídeo
              child: _isError
                  ? const Center(
                      child: Text(
                        'Erro ao carregar o vídeo.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : SizedBox(
                          height: 230,
                          width: double.infinity,
                          child: Image.asset(
                            widget.image,
                            fit: BoxFit.cover,
                          ),
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
