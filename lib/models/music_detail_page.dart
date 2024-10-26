import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MusicDetailPage extends StatefulWidget {
  const MusicDetailPage({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  State<MusicDetailPage> createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
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
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
