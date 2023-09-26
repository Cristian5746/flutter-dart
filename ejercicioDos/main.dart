import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  fetchChuckNorrisJoke();
}

void fetchChuckNorrisJoke() async {
  final response =
      await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final String joke = data['value'];
    print('Chuck Norris Joke: $joke');
  } else {
    print('Fallo al cargar. code: ${response.statusCode}');
  }
}
