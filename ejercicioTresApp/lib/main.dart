import 'package:flutter/material.dart';

void main() {
  runApp(const AppBases());
}

class AppBases extends StatelessWidget {
  const AppBases({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: createScaffold(),
    );
  }
}

createScaffold() {
  const int calificacionEstrellas = 5;

  return Scaffold(
    appBar: AppBar(
      title: const Text("Aplicación 2023 2"),
    ),
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 0.0, bottom: 20.0),
            child: Image.network(''),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        'Santuario de Las Lajas',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Ipiales, Colombia',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20.0,
                  ),
                  Text(
                    calificacionEstrellas.toString(),
                    style: const TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.blue,
                    size: 30.0,
                  ),
                  Text(
                    'Llamar',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.map,
                    color: Colors.blue,
                    size: 24.0,
                  ),
                  Text(
                    'Mapa',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.share,
                    color: Colors.blue,
                    size: 36.0,
                  ),
                  Text(
                    'Compartir',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
                'El Santuario de Las Lajas es una basílica colombiana construida en el cañón del río Guáitara. Ha sido declarado Patrimonio Nacional de Colombia y es un importante destino turístico.'),
          )
        ],
      ),
    ),
  );
}
