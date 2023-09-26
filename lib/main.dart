import 'package:flutter/material.dart';
import 'controllers/marvel_controller.dart';
import 'views/character_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MarvelController marvelController = MarvelController(
    publicKey: '4172741ecf34b2048fcc99cac389bb57',
    privateKey: '2a96ab269d1f37643120862cb0a09992046040ac',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Marvel API',
            style: TextStyle(
              fontSize: 45.0, // Aumenta el tamaño de fuente a 60.0
              fontWeight: FontWeight.bold, // Letra en negrita
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: CharacterListView(controller: marvelController),
      ),
    );
  }
}
