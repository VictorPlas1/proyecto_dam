import 'dart:io';
import 'dart:math';

import 'Paciente.dart';

class Examen {
  int obtenerPuntuacionLogo() {
    stdout.writeln('''
Pregunta de Logopedia.
1- ¿La palabra "aber" está bien escrita?    1 SI 2 NO''');
    var respuesta1 = stdin.readLineSync() ?? "e";
    var opcion1 = int.tryParse(respuesta1);
    switch (opcion1) {
      case 1:
        return Random().nextInt(30) + 1;
      case 2:
        return Random().nextInt(90) + 1;
      default:
        return 0;
    }
  }

  int obtenerPuntuacioPsico() {
    stdout.writeln('''Pregunta de Psicologia
       2- ¿Tienes problemas con la bebida?       1 SI  2 NO''');
    var respuesta2 = stdin.readLineSync() ?? "e";
    var opcion2 = int.tryParse(respuesta2);
    switch (opcion2) {
      case 1:
        return Random().nextInt(30) + 1;

      case 2:
        return Random().nextInt(90) + 1;
      default:
        return 0;
    }
  }

  int obtenerPuntuacionMotriz() {
    stdout.writeln('''Pregunta de Fisioterapia
        3- ¿ Te duele la espalda?                 1 SI 2 NO''');
    var respuesta3 = stdin.readLineSync() ?? "e";
    var opcion3 = int.tryParse(respuesta3);
    switch (opcion3) {
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
    stdout.writeln("${paciente.nombre} necesita sesiones de Logopedia");
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

  verFactura() {
    var total = sesionesNecesariasLogo(Paciente()) * 34;
    stdout.writeln("El importe total de tu Factura es: $total");
  }

  recibirTratamiento(Paciente paciente) async {
    stdout.writeln('''
¿Que tipo de trartamiento desea realizar?
1- Logopeda
2 - Psicologia
3 - Fisioterapia ''');
    var respuesta = stdin.readLineSync() ?? "e";
    var opcion = int.tryParse(respuesta);

    switch (opcion) {
      case 1:
        juegoLogo(paciente);
        await Paciente().menuInicioPaciente(paciente);
        break;
      case 2:
        sesionPsicologia();
        break;
      case 4:
        sesionFisio();
    }
  }

  sesionLogopedia(paciente) {
    stdout.writeln(''' Bienvenido ${paciente.nombre} a sesiones de Logopedia
        Su habilidad actual es ${paciente.habilidadlogo},
        necesitas ${sesionesNecesariasLogo(paciente)} sesiones  para alcanzar la mayor habilidad.
        ''');
  }

  sesionPsicologia() {}

  sesionFisio() {}

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
}
