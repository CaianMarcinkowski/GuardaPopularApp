import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MusicDetailPage extends StatefulWidget {
  const MusicDetailPage({
    super.key,
    required this.title,
    required this.image,
    required this.videoUrl,
    required this.duration,
  });

  final String title;
  final String image;
  final String videoUrl;
  final Duration duration;

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
          _isError = true; // Define que houve um erro na inicialização
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _isError
                ? Center(
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
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
            // : SizedBox(
            //     height: 300,
            //     width: double.infinity,
            //     child: Image.asset(
            //       widget.image,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timer),
                      const SizedBox(width: 10),
                      Text(
                        '${widget.duration.inMinutes} minutos e \n${(widget.duration.inSeconds % 60).toString().padLeft(2, '0')} segundos',
                        style: TextStyle(
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
                      Icon(Icons.person),
                      const SizedBox(width: 10),
                      Text(
                        'Endrigo Giacomin',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
