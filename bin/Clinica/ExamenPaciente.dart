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
    int sesionesRecibidasLogo = 0;
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
    int sesionesRecibidasPsic = 0;
    print("${paciente.nombre} necesita sesiones de Psicologo");
    while (paciente.habilidadpsic < 100) {
      paciente.habilidadpsic += 10;
      sesionesRecibidasPsic++;
    }
    sleep(Duration(seconds: 2));
    print(sesionesRecibidasPsic);
  }

  sesionesNecesariasMotriz(Paciente paciente) {
    int sesionesRecibidasMotriz = 0;
    print("${paciente.nombre} necesita sesiones de Fisioterapia");
    while (paciente.habilidadmotriz < 100) {
      paciente.habilidadmotriz += 10;
      sesionesRecibidasMotriz++;
    }
    sleep(Duration(seconds: 2));
    print(sesionesRecibidasMotriz);
  }
}
