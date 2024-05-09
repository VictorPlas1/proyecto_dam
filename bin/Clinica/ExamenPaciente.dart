// ignore_for_file: unnecessary_string_escapes

import 'dart:io';
import 'dart:math';

import '../Funcionamiento/App.dart';
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
    var habilitylogo = paciente.habilidadlogo;
    while (habilitylogo < 100) {
      habilitylogo += 10;
      sesionesRecibidasLogo++;
    }
    sleep(Duration(seconds: 2));
    print(sesionesRecibidasLogo);
  }

  sesionesNecesariasPsic(Paciente paciente) {
    var sesionesRecibidasPsic = 0;
    stdout.writeln("${paciente.nombre} necesita sesiones de Psicologia");
    var habilityPsic = paciente.habilidadpsic;
    while (habilityPsic < 100) {
      habilityPsic += 10;
      sesionesRecibidasPsic++;
    }
    sleep(Duration(seconds: 2));

    print(sesionesRecibidasPsic);
  }

  sesionesNecesariasMotriz(Paciente paciente) {
    var sesionesRecibidasMotriz = 0;
    print("${paciente.nombre} necesita sesiones de Fisioterapia");
    var habilityMotriz = paciente.habilidadmotriz;
    while (habilityMotriz < 100) {
      habilityMotriz += 10;
      sesionesRecibidasMotriz++;
    }
    sleep(Duration(seconds: 2));
    print(sesionesRecibidasMotriz);
  }

  verFactura(Paciente paciente) async {
    int sesionL = 0;
    int sesionP = 0;
    int sesionF = 0;
    var habilityLogo = paciente.habilidadlogo;
    var habilityMotriz = paciente.habilidadmotriz;
    var habilityPsic = paciente.habilidadpsic;

    while (habilityLogo < 100) {
      habilityLogo += 10;
      sesionL++;
    }
    while (habilityPsic < 100) {
      habilityPsic += 10;
      sesionP++;
    }
    while (habilityMotriz < 100) {
      habilityMotriz += 10;
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
    sesionL = 0;
    sesionF = 0;
    sesionP = 0;
  }

  recibirTratamiento(Paciente paciente) {
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
        juegoLogo(paciente);
        App().inicioAPP();

        break;
      case 2:
        juegoPsicologia(paciente);
        App().inicioAPP();
        break;
      case 3:
        juegoFisio(paciente);
        App().inicioAPP();
    }
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
    dibujo1();
    stdout.writeln('''
        La palabra a adivinar puede ser una de las siguientes:
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
        break;
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
            '''Lo siento, la letra $respuesta no está en la palabra.   Intentos: $intentos ''');
      }

      if (palabraAhorcado.contains(respuesta)) {
        print('Felicidades, has acertado la letra.');
      }
      if (palabraAhorcado == palabraSecreta) {
        print('''Enhorabuena, has acertado la palabra. Tu habilidad ha mejorado.


              Habilidad actual ${paciente.habilidadlogo + 50}


                   Nos vemos pronto!!''');
        break;
      }
      if (intentos == 0) {
        print(
            'Lo siento, te has quedado sin intentos, la palabra era $palabraSecreta');
        dibujo2();
      }
    } while (intentos > 0);
  }

  juegoPsicologia(Paciente paciente) {
    List<String> palabras = [
      'bipolar',
      'anorexia',
      'depresion',
      'ansiedad',
      'droga',
      'ludopata'
    ];
    Random random = Random();
    String palabraSecreta = palabras[random.nextInt(palabras.length)];
    String palabraAhorcado = '_' * palabraSecreta.length;
    int intentos = palabraSecreta.length + 3;
    dibujo1();
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


              Habilidad actual ${paciente.habilidadpsic + 50}
              
              
                 Nos vemos pronto!!!''');

        break;
      }
      if (intentos == 0) {
        print(
            'Lo siento, te has quedado sin intentos, la palabra era $palabraSecreta');
        dibujo2();
      }
    } while (intentos > 0);
  }

  juegoFisio(Paciente paciente) {
    List<String> palabras = [
      'femur',
      'tibia',
      'perone',
      'tibia',
      'cubito',
      'clavicula'
    ];
    Random random = Random();
    String palabraSecreta = palabras[random.nextInt(palabras.length)];
    String palabraAhorcado = '_' * palabraSecreta.length;
    int intentos = palabraSecreta.length + 3;
    dibujo1();
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


              Habilidad actual ${paciente.habilidadmotriz + 50}
              
                 Nos vemos pronto!!!''');
        break;
      }
      if (intentos == 0) {
        print(
            'Lo siento, te has quedado sin intentos, la palabra era $palabraSecreta');
        dibujo2();
      }
    } while (intentos > 0);
  }

  dibujo1() {
    stdout.writeln('''    

                       _____
                       |    |
                            |
                            |
                            |
                        --------    
    
    ''');
  }

  dibujo2() {
    stdout.writeln('''    

                       _____
                       |    |
                       O    |
                      <|>   |
                       |    |
                       |    |
                      <|>   |
                            |
                         -------  
    
    ''');
  }
}

//FUNCIONES HERRAMIENTA
bool tresOpciones(var opcion) =>
    opcion == null && opcion != 1 && opcion != 2 && opcion != 3;
bool dosOpciones(var opcion) => opcion == null && opcion != 1 && opcion != 2;
int? parsearOpcion(String respuesta) => int.tryParse(respuesta);
