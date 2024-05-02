class Utiles {
  bool tresOpciones(var opcion) =>
      opcion == null && opcion != 1 && opcion != 2 && opcion != 3;
  bool dosOpciones(var opcion) => opcion == null && opcion != 1 && opcion != 2;

  bool cuatroOpciones(var opcion) =>
      opcion == null &&
      opcion != 1 &&
      opcion != 2 &&
      opcion != 3 &&
      opcion != 4;

  bool cincoOpciones(var opcion) =>
      opcion == null &&
      opcion != 1 &&
      opcion != 2 &&
      opcion != 3 &&
      opcion != 4 &&
      opcion != 5;

  seisOpciones(var opcion) =>
      opcion == null &&
      opcion != 1 &&
      opcion != 2 &&
      opcion != 3 &&
      opcion != 4 &&
      opcion != 5 &&
      opcion != 6;
  int? parsearOpcion(String respuesta) => int.tryParse(respuesta);
}
