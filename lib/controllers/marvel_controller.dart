import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/character.dart';
import 'package:crypto/crypto.dart' as crypto;

class MarvelController {
  final String publicKey;
  final String privateKey;

  MarvelController({required this.publicKey, required this.privateKey});

  Future<List<Character>> fetchCharacters() async {
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _generateMd5('$ts$privateKey$publicKey');

    final response = await http.get(
      Uri.parse(
        'https://gateway.marvel.com/v1/public/characters?ts=$ts&apikey=$publicKey&hash=$hash&limit=20',
      ),
    );

    if (response.statusCode == 200) {
      final data =
          json.decode(response.body)['data']['results'] as List<dynamic>;
      final characters = data.map((characterData) {
        // Extraer datos adicionales de la API
        final comicsCount = characterData['comics']['available'];
        final seriesCount = characterData['series']['available'];
        final storiesCount = characterData['stories']['available'];
        final eventsCount = characterData['events']['available'];

        // Extraer los nombres de las 3 primeras series
        final seriesList = characterData['series']['items'] as List<dynamic>;
        final firstThreeSeries = seriesList
            .take(3)
            .map((series) => series['name'] as String)
            .toList();

        return Character(
          name: characterData['name'],
          description: characterData['description'],
          imageUrl:
              '${characterData['thumbnail']['path']}.${characterData['thumbnail']['extension']}',
          comicsCount: comicsCount,
          seriesCount: seriesCount,
          storiesCount: storiesCount,
          eventsCount: eventsCount,
          firstThreeSeries: firstThreeSeries,
        );
      }).toList();
      return characters;
    } else {
      throw Exception('Failed to load characters');
    }
  }

  String _generateMd5(String data) {
    final content = utf8.encode(data);
    final digest = crypto.md5.convert(content);
    return digest.toString();
  }
}
