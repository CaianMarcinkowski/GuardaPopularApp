import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guarda_popular/pages/home_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  String _loadingText = 'Carregando';
  int _dotCount = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(); // Faz a animação girar infinitamente

    // Configura o Timer para atualizar o texto a cada 500ms
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _dotCount = (_dotCount + 1) % 4; // Gera um ciclo de 0 a 3
        _loadingText =
            'Carregando' + '.' * _dotCount; // Adiciona de 0 a 3 pontos
      });
    });

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // Chama a HomePage
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel(); // Cancela o Timer quando a página é desfeita
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(
                  turns: _controller, // Aplica a rotação contínua
                  child: Image.asset(
                    'assets/images/logo_without_background.png', // Substitua pelo caminho da sua imagem
                    width: 400,
                  ),
                ),
                Text(
                  _loadingText,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
