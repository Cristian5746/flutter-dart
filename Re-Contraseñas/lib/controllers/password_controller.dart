import 'package:flutter/services.dart';
import 'dart:math';

class PasswordController {
  String generatedPassword = '';
  int passwordLength = 8;
  bool includeUppercase = true;
  bool includeLowercase = true;
  bool includeNumbers = true;
  bool includeSpecialCharacters = true;

  void generatePassword() {
    final random = Random();
    final charset = StringBuffer();

    if (includeUppercase) {
      charset.write('ABCDEFGHIJKLMNOPQRSTUVWXYZ');
    }
    if (includeLowercase) {
      charset.write('abcdefghijklmnopqrstuvwxyz');
    }
    if (includeNumbers) {
      charset.write('0123456789');
    }
    if (includeSpecialCharacters) {
      charset.write('!@#%^&*()_+[]{}|;:,.<>?');
    }

    if (charset.isEmpty) {
      // Si no se seleccionan opciones, generamos una contraseña con números y letras por defecto
      charset.write(
          'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789');
    }

    final passwordString =
        charset.toString(); // Convierte StringBuffer a String

    generatedPassword = String.fromCharCodes(
      Iterable.generate(
        passwordLength,
        (_) => passwordString.codeUnitAt(random.nextInt(passwordString.length)),
      ),
    );
  }
}
