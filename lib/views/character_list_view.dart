import 'package:flutter/material.dart';
import '../controllers/marvel_controller.dart';
import '../models/character.dart';
import 'character_details_view.dart';

class CharacterListView extends StatefulWidget {
  final MarvelController controller;

  CharacterListView({required this.controller});

  @override
  _CharacterListViewState createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  late Future<List<Character>> charactersFuture;

  @override
  void initState() {
    super.initState();
    charactersFuture = widget.controller.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: charactersFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final characterList = snapshot.data as List<Character>;

          return ListView.builder(
            itemCount: characterList.length,
            itemBuilder: (context, index) {
              final character = characterList[index];

              return GestureDetector(
                onTap: () {
                  // Navegar a la vista de detalles del personaje
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          CharacterDetailsView(character: character),
                    ),
                  );
                },
                child: Card(
                  elevation: 2.0, // Agregar sombra al card
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0), // Espacio entre los cards
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(
                        10.0), // Espacio dentro del ListTile
                    leading: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey), // Borde gris
                        image: DecorationImage(
                          image: NetworkImage(character.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      character.name,
                      style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight:
                              FontWeight.bold), // Tamaño de fuente más grande
                    ),
                    subtitle: const Text(
                      'Marvel', // Título "Marvel"
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
