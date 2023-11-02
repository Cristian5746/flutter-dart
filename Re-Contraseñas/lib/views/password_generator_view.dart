import 'package:flutter/material.dart';

import '../controllers/password_controller.dart';

class PasswordGeneratorView extends StatefulWidget {
  const PasswordGeneratorView({Key? key}) : super(key: key);

  @override
  _PasswordGeneratorViewState createState() => _PasswordGeneratorViewState();
}

class _PasswordGeneratorViewState extends State<PasswordGeneratorView> {
  final PasswordController _controller = PasswordController();
  final TextEditingController _lengthController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller
        .generatePassword(); // Generar una contraseña inicial al iniciar la pantalla
  }

  void _updatePasswordLength(double value) {
    setState(() {
      final length = value.toInt();
      _controller.passwordLength = length;
      _controller
          .generatePassword(); // Generar una nueva contraseña al ajustar la longitud
    });
  }

  void _updateOptions() {
    setState(() {
      _controller
          .generatePassword(); // Generar una nueva contraseña al ajustar las opciones
    });
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
            _controller.generatedPassword,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Slider(
            value: _controller.passwordLength.toDouble(),
            min: 1,
            max: 20,
            onChanged: _updatePasswordLength,
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _controller.includeUppercase,
                    onChanged: (value) {
                      setState(() {
                        _controller.includeUppercase = value!;
                        _updateOptions();
                      });
                    },
                  ),
                  Text('Mayúsculas'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _controller.includeLowercase,
                    onChanged: (value) {
                      setState(() {
                        _controller.includeLowercase = value!;
                        _updateOptions();
                      });
                    },
                  ),
                  Text('Minúsculas'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _controller.includeNumbers,
                    onChanged: (value) {
                      setState(() {
                        _controller.includeNumbers = value!;
                        _updateOptions();
                      });
                    },
                  ),
                  Text('Números'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _controller.includeSpecialCharacters,
                    onChanged: (value) {
                      setState(() {
                        _controller.includeSpecialCharacters = value!;
                        _updateOptions();
                      });
                    },
                  ),
                  Text('Especiales'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
