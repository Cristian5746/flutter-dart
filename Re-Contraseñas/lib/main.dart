import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

void main() {
  runApp(const AppBases());
}

class AppBases extends StatelessWidget {
  const AppBases({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Generador de Contraseñas"),
        ),
        body: const PasswordGeneratorWidget(),
      ),
    );
  }
}

class PasswordGeneratorWidget extends StatefulWidget {
  const PasswordGeneratorWidget({Key? key}) : super(key: key);

  @override
  _PasswordGeneratorWidgetState createState() =>
      _PasswordGeneratorWidgetState();
}

class _PasswordGeneratorWidgetState extends State<PasswordGeneratorWidget> {
  int passwordLength = 8;
  String generatedPassword = '';

  void _generatePassword() {
    final random = Random();
    const charset =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%^&*()_+[]{}|;:,.<>?';

    generatedPassword = String.fromCharCodes(
      Iterable.generate(
        passwordLength,
        (_) => charset.codeUnitAt(random.nextInt(charset.length)),
      ),
    );
  }

  void _copyPasswordToClipboard() {
    Clipboard.setData(ClipboardData(text: generatedPassword));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Contraseña copiada al portapapeles'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _generatePassword(); // Generar una contraseña inicial al iniciar la pantalla
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.0),
          Text(
            'Generador de Contraseñas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          Text(
            'Contraseña Generada:',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            generatedPassword,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Slider(
            value: passwordLength.toDouble(),
            min: 1,
            max: 20,
            onChanged: (value) {
              setState(() {
                passwordLength = value.toInt();
                _generatePassword(); // Generar una nueva contraseña al ajustar la longitud
              });
            },
          ),
          SizedBox(height: 20),
          SizedBox(height: 20.0),
          IconButton(
            onPressed: () {
              _copyPasswordToClipboard();
            },
            icon: Icon(Icons.copy),
            iconSize: 40.0,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
