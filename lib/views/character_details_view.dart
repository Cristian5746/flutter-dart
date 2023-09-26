import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterDetailsView extends StatelessWidget {
  final Character character;

  CharacterDetailsView({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        backgroundColor: Colors.red, // Cambiar el color del AppBar a rojo
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del personaje
            Image.network(character.imageUrl),
            SizedBox(height: 19.0),
            // Descripción del personaje
            Text('Descripción: ${character.description}'),
            SizedBox(height: 19.0),
            // Datos adicionales del personaje
            Text('Cantidad de Comics: ${character.comicsCount}'),
            Text('Cantidad de Series: ${character.seriesCount}'),
            Text('Cantidad de Stories: ${character.storiesCount}'),
            Text('Cantidad de Events: ${character.eventsCount}'),
            SizedBox(height: 20.0),
            // Nombre de las 3 primeras series
            Text('Primeras 3 Series:'),
            for (var series in character.firstThreeSeries) Text('- $series'),
          ],
        ),
      ),
    );
  }
}
