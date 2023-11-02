import 'dart:math';

class PasswordModel {
  String password = '';
  int passwordLength = 8;

  void generatePassword() {
    final random = Random();
    const charset =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%^&*()_+[]{}|;:,.<>?';

    password = String.fromCharCodes(
      Iterable.generate(
        passwordLength,
        (_) => charset.codeUnitAt(random.nextInt(charset.length)),
      ),
    );
  }
}
