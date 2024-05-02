import 'dart:io';
import 'dart:math';

import 'Paciente.dart';

class Examen {
  int obtenerPuntuacionLogo() {
    int? opcion;
    do {
      stdout.writeln('''
Pregunta de Logopedia.
1- ¿La palabra "aber" está bien escrita?    1 SI 2 NO''');
      String respuesta = stdin.readLineSync() ?? "e";
      opcion = parsearOpcion(respuesta);
    } while (dosOpciones(opcion));
    switch (opcion) {
      case 1:
        return Random().nextInt(30) + 1;
      case 2:
        return Random().nextInt(90) + 1;
      default:
        return 0;
    }
  }

  int obtenerPuntuacioPsico() {
    int? opcion;
    do {
      stdout.writeln('''Pregunta de Psicologia
       2- ¿Tienes problemas con la bebida?       1 SI  2 NO''');
      String respuesta = stdin.readLineSync() ?? "e";
      opcion = parsearOpcion(respuesta);
    } while (dosOpciones(opcion));
    switch (opcion) {
      case 1:
        return Random().nextInt(30) + 1;

      case 2:
        return Random().nextInt(90) + 1;
      default:
        return 0;
    }
  }

  int obtenerPuntuacionMotriz() {
    int? opcion;
    do {
      stdout.writeln('''Pregunta de Fisioterapia
        3- ¿ Te duele la espalda?                 1 SI 2 NO''');
      String respuesta = stdin.readLineSync() ?? "e";
      opcion = parsearOpcion(respuesta);
    } while (dosOpciones(opcion));
    switch (opcion) {
      case 1:
        return Random().nextInt(30) + 1;

      case 2:
        return Random().nextInt(90) + 1;
      default:
        return 0;
    }
  }

  sesionesNecesariasLogo(Paciente paciente) {
    var sesionesRecibidasLogo = 0;
    print("${paciente.nombre} necesita sesiones de Logopedia");
    while (paciente.habilidadlogo < 100) {
      paciente.habilidadlogo += 10;
      sesionesRecibidasLogo++;
    }
    sleep(Duration(seconds: 2));
    print(sesionesRecibidasLogo);

    return sesionesRecibidasLogo;
  }

  sesionesNecesariasPsic(Paciente paciente) {
    var sesionesRecibidasPsic = 0;
    stdout.writeln("${paciente.nombre} necesita sesiones de Psicologo");
    while (paciente.habilidadpsic < 100) {
      paciente.habilidadpsic += 10;
      sesionesRecibidasPsic++;
    }
    sleep(Duration(seconds: 2));

    print(sesionesRecibidasPsic);
    return sesionesRecibidasPsic;
  }

  sesionesNecesariasMotriz(Paciente paciente) {
    var sesionesRecibidasMotriz = 0;
    print("${paciente.nombre} necesita sesiones de Fisioterapia");
    while (paciente.habilidadmotriz < 100) {
      paciente.habilidadmotriz += 10;
      sesionesRecibidasMotriz++;
    }
    sleep(Duration(seconds: 2));
    print(sesionesRecibidasMotriz);

    return sesionesRecibidasMotriz;
  }

  verFactura(Paciente paciente) {
    int sesionL = 0;
    int sesionP = 0;
    int sesionF = 0;
    while (paciente.habilidadlogo < 100) {
      paciente.habilidadlogo += 10;
      sesionL++;
    }
    while (paciente.habilidadpsic < 100) {
      paciente.habilidadpsic += 10;
      sesionP++;
    }
    while (paciente.habilidadmotriz < 100) {
      paciente.habilidadmotriz += 10;
      sesionF++;
    }

    stdout.writeln('''Total factura Logopedia
      $sesionL sesiones recibidas X 25 € 
     
       ${sesionL * 25} €
       Total factura Psicologia
       $sesionP sesiones recibidas X 38€
       ${sesionP * 38} €
       Total factura Fisioterapia
       $sesionF sesiones recibidad X 32€ 
       ${sesionF * 32} €
       El total a pagar es ${sesionL * 25 + sesionP * 28 + sesionF * 32} €''');
  }

  recibirTratamiento(Paciente paciente) async {
    int? opcion;
    do {
      stdout.writeln('''
¿Que tipo de trartamiento desea realizar?
1- Logopeda
2 - Psicologia
3 - Fisioterapia ''');
      String respuesta = stdin.readLineSync() ?? "e";
      opcion = parsearOpcion(respuesta);
    } while (tresOpciones(opcion));
    switch (opcion) {
      case 1:
        sesionLogopedia(paciente);
        juegoLogo(paciente);
        Paciente().menuInicioPaciente(paciente);

        break;
      case 2:
        sesionPsicologia(paciente);
        juegoPsicologia(paciente);
        Paciente().menuInicioPaciente(paciente);
        break;
      case 3:
        sesionFisio(paciente);
        juegoFisio(paciente);
        Paciente().menuInicioPaciente(paciente);
    }
  }

  sesionLogopedia(Paciente paciente) {
    stdout.writeln(''' Bienvenido ${paciente.nombre} a sesiones de Logopedia.
        Su habilidad actual es ${paciente.habilidadlogo},
        necesitas ${sesionesNecesariasLogo(paciente)} sesiones  para alcanzar la mayor habilidad.
        ''');
  }

  sesionPsicologia(Paciente paciente) {
    stdout.writeln(''' Bienvenido ${paciente.nombre} a sesiones de Psicologia.
        Su habilidad actual es ${paciente.habilidadpsic},
        necesitas ${sesionesNecesariasPsic(paciente)} sesiones  para alcanzar la mayor habilidad.
        ''');
  }

  sesionFisio(Paciente paciente) {
    stdout.writeln(''' Bienvenido ${paciente.nombre} a sesiones de Fisioterapia.
        Su habilidad actual es ${paciente.habilidadmotriz},
        necesitas ${sesionesNecesariasMotriz(paciente)} sesiones  para alcanzar la mayor habilidad.
        ''');
  }

  juegoLogo(Paciente paciente) {
    List<String> palabras = [
      'mesa',
      'gato',
      'puerta',
      'movil',
      'suelo',
      'libro'
    ];
    Random random = Random();
    String palabraSecreta = palabras[random.nextInt(palabras.length)];
    String palabraAhorcado = '_' * palabraSecreta.length;
    int intentos = palabraSecreta.length + 3;
    stdout.writeln(''' La palabra a adivinar puede ser una de las siguientes:
    $palabras''');

    stdout.writeln(
        'La palabra a adivinar tiene ${palabraSecreta.length} letras.');
    do {
      print('Palabra: $palabraAhorcado');
      print('Intentos $intentos');
      stdout.writeln("Introduce una letra");
      String respuesta = stdin.readLineSync() ?? "e";

      if (respuesta == palabraSecreta) {
        print("Enhorabuena, has acertado");
      } else if (palabraSecreta.contains(respuesta)) {
        for (int i = 0; i < palabraSecreta.length; i++) {
          if (palabraSecreta[i] == respuesta) {
            palabraAhorcado = palabraAhorcado.replaceFirst('_', respuesta, i++);
            intentos--;
          }
        }
      } else {
        intentos--;
        print(
            '''Lo siento, la letra $respuesta no está en la palabra.   Intentos: $intentos''');
      }

      if (palabraAhorcado.contains(respuesta)) {
        print('Felicidades, has acertado la letra.');
      }
      if (palabraAhorcado == palabraSecreta) {
        print('''Enhorabuena, has acertado la palabra. Tu habilidad ha mejorado.
              Habilidad actual ${paciente.habilidadlogo + 50}''');
        break;
      }
      if (intentos == 0) {
        print(
            'Lo siento, te has quedado sin intentos, la palabra era $palabraSecreta');
      }
    } while (intentos > 0);
  }

  juegoPsicologia(Paciente paciente) {
    List<String> palabras = [
      'bipolar',
      'anorexia',
      'depresion',
      'dislalia',
      'droga',
      'ludopata'
    ];
    Random random = Random();
    String palabraSecreta = palabras[random.nextInt(palabras.length)];
    String palabraAhorcado = '_' * palabraSecreta.length;
    int intentos = palabraSecreta.length + 3;
    stdout.writeln(''' La palabra a adivinar puede ser una de las siguientes:
    $palabras''');

    stdout.writeln(
        'La palabra a adivinar tiene ${palabraSecreta.length} letras.');
    do {
      print('Palabra: $palabraAhorcado');
      print('Intentos $intentos');
      stdout.writeln("Introduce una letra");
      String respuesta = stdin.readLineSync() ?? "e";

      if (respuesta == palabraSecreta) {
        print("Enhorabuena, has acertado");
      } else if (palabraSecreta.contains(respuesta)) {
        for (int i = 0; i < palabraSecreta.length; i++) {
          if (palabraSecreta[i] == respuesta) {
            palabraAhorcado = palabraAhorcado.replaceFirst('_', respuesta, i++);
            intentos--;
          }
        }
      } else {
        intentos--;
        print(
            '''Lo siento, la letra $respuesta no está en la palabra.   Intentos: $intentos''');
      }

      if (palabraAhorcado.contains(respuesta)) {
        print('Felicidades, has acertado la letra.');
      }
      if (palabraAhorcado == palabraSecreta) {
        print('''Enhorabuena, has acertado la palabra. Tu habilidad ha mejorado.
              Habilidad actual ${paciente.habilidadpsic + 50}''');
        break;
      }
      if (intentos == 0) {
        print(
            'Lo siento, te has quedado sin intentos, la palabra era $palabraSecreta');
      }
    } while (intentos > 0);
  }

  juegoFisio(Paciente paciente) {
    List<String> palabras = [
      'femur',
      'tibia',
      'perone',
      'tibia',
      'rodilla',
      'tobillo'
    ];
    Random random = Random();
    String palabraSecreta = palabras[random.nextInt(palabras.length)];
    String palabraAhorcado = '_' * palabraSecreta.length;
    int intentos = palabraSecreta.length + 3;
    stdout.writeln(''' La palabra a adivinar puede ser una de las siguientes:
    $palabras''');

    stdout.writeln(
        'La palabra a adivinar tiene ${palabraSecreta.length} letras.');
    do {
      print('Palabra: $palabraAhorcado');
      print('Intentos $intentos');
      stdout.writeln("Introduce una letra");
      String respuesta = stdin.readLineSync() ?? "e";

      if (respuesta == palabraSecreta) {
        print("Enhorabuena, has acertado");
      } else if (palabraSecreta.contains(respuesta)) {
        for (int i = 0; i < palabraSecreta.length; i++) {
          if (palabraSecreta[i] == respuesta) {
            palabraAhorcado = palabraAhorcado.replaceFirst('_', respuesta, i++);
            intentos--;
          }
        }
      } else {
        intentos--;
        print(
            '''Lo siento, la letra $respuesta no está en la palabra.   Intentos: $intentos''');
      }

      if (palabraAhorcado.contains(respuesta)) {
        print('Felicidades, has acertado la letra.');
      }
      if (palabraAhorcado == palabraSecreta) {
        print('''Enhorabuena, has acertado la palabra. Tu habilidad ha mejorado.
              Habilidad actual ${paciente.habilidadmotriz + 50}''');
        break;
      }
      if (intentos == 0) {
        print(
            'Lo siento, te has quedado sin intentos, la palabra era $palabraSecreta');
      }
    } while (intentos > 0);
  }

  //FUNCIONES HERRAMIENTA
  bool tresOpciones(var opcion) =>
      opcion == null && opcion != 1 && opcion != 2 && opcion != 3;
  bool dosOpciones(var opcion) => opcion == null && opcion != 1 && opcion != 2;
  int? parsearOpcion(String respuesta) => int.tryParse(respuesta);
}
