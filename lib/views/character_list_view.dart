// views/character_list_view.dart
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
          return Center(child: CircularProgressIndicator());
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
                  child: Row(
                    children: [
                      // Imagen del personaje en un círculo
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(character.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      // Nombre del personaje
                      Text(
                        character.name,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
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
