import 'dart:io';

void main() {
  print(
      "Para calcular la temperatura de Celsius Fahrenheit escriba 1 o para Fahrenheit a Celsius escriba 2");
  int opcion = int.parse(stdin.readLineSync()!);
  print("Ingrese los grados a convertir");
  int grados = int.parse(stdin.readLineSync()!);

  if (opcion == 1) {
    print("Usted decidio convertir de Celsius a Fahrenheit");
    double resultado = (grados * 1.8) + 32;
    print(resultado);
  } else if (opcion == 2) {
    print("Usted decidio convertir de Fahrenheit a celsius");
    double resultado = (grados - 32) / 1.8;
    print(resultado);
  }
}
