import 'dart:io';

void main() {
  print(
      "Ingrese la cantidad de personas que entraron en la semana al hospital");
  int numeroPersonas = int.parse(stdin.readLineSync()!);

  int hombre = 0;
  int mujer = 0;
  int soltero = 0;
  int casado = 0;
  int viudo = 0;
  int edadHombresCasados = 0;

  for (int i = 0; i < numeroPersonas; i++) {
    print(
        "Ingrese el numero correspondiente al sexo de la persona (1. Hombre, 2. Mujer)");
    int sexo = int.parse(stdin.readLineSync()!);
    print(
        "Ingrese el numero correspondiente al estado civil de la persona (1. Soltero, 2. Casado, 3. Viudo)");
    int estadoCivil = int.parse(stdin.readLineSync()!);
    print("Ingrese la edad de la persona");
    int edad = int.parse(stdin.readLineSync()!);

    if (sexo == 1) {
      hombre = hombre + 1;
      if (estadoCivil == 1) {
        soltero = soltero + 1;
      } else if (estadoCivil == 2) {
        casado = casado + 1;
        edadHombresCasados += edad;
      } else {
        viudo = viudo + 1;
      }
    } else {
      mujer = mujer + 1;
      if (estadoCivil == 1) {
        soltero = soltero + 1;
      } else if (estadoCivil == 2) {
        casado = casado + 1;
      } else {
        viudo = viudo + 1;
      }
    }
  }

  double porcentajeHombresSolteros =
      (soltero.toDouble() / hombre.toDouble()) * 100;

  double edadPromedioHombresCasados =
      edadHombresCasados.toDouble() / casado.toDouble();

  double porcentajeMujeresSolteras =
      (soltero.toDouble() / (hombre + mujer).toDouble()) * 100;

  print(
      "Porcentaje de hombres solteros: ${porcentajeHombresSolteros.toStringAsFixed(2)}%");
  print(
      "Edad promedio de hombres casados: ${edadPromedioHombresCasados.toStringAsFixed(2)}");
  print(
      "Porcentaje de mujeres solteras: ${porcentajeMujeresSolteras.toStringAsFixed(2)}%");
}
