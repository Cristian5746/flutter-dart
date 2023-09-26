import 'package:flutter/material.dart';
import 'controllers/password_controller.dart';
import 'views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PasswordController _controller = PasswordController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generador de Contraseñas',
      // Pasar una instancia válida de PasswordController
    );
  }
}
