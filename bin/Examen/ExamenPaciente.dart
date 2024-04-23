import 'dart:io';
import 'dart:math';

import '../Clinica/Paciente.dart';
import '../Funcionamiento/Database.dart';

class Examen {
  obtenerPuntuacionLogo() async {
    await Database().conexion();
    stdout.writeln('''
Pregunta de Logopedia.
1- ¿La palabra "aber" está bien escrita?    1 SI 2 NO''');
    var respuesta1 = stdin.readLineSync() ?? "e";
    var opcion1 = int.tryParse(respuesta1);

    switch (opcion1) {
      case 1:
        {
          Paciente().habilidaLogo = Random().nextInt(30);
        }
        break;
      case 2:
        {
          Paciente().habilidaLogo = Random().nextInt(90);
        }
    }
  }

  obtenerPuntuacioPsico() {
    stdout.writeln('''Pregunta de Psicologia
       2- ¿Tienes problemas con la bebida?       1 SI  2 NO''');
    var respuesta2 = stdin.readLineSync() ?? "e";
    var opcion2 = int.tryParse(respuesta2);
    switch (opcion2) {
      case 1:
        Paciente().habilidadPsic = Random().nextInt(20);
        break;
      case 2:
        Paciente().habilidadPsic = Random().nextInt(80);
    }
  }

  obtenerPuntuacionMotriz() {
    stdout.writeln('''Pregunta de Fisioterapia
        3- ¿ Te duele la espalda?                 1 SI 2 NO''');
    var respuesta3 = stdin.readLineSync() ?? "e";
    var opcion3 = int.tryParse(respuesta3);
    switch (opcion3) {
      case 1:
        Paciente().habilidadMotriz = Random().nextInt(35);
        break;
      case 2:
        Paciente().habilidadMotriz = Random().nextInt(70);
    }
    stdout.writeln('''El resultado de tus habilidades es
    Logopedia ${Paciente().habilidaLogo},
    Psicologo ${Paciente().habilidadPsic}
    Fisioterapia${Paciente().habilidadMotriz} ''');
  }

  sesionesNecesariasLogo(Paciente paciente) {
    int sesionesRecibidasLogo = 0;
    while (Paciente().habilidaLogo > 100) {
      print("${Paciente().nombre} necesita sesiones de Logopedia");
      Paciente().habilidaLogo += 10;
      sesionesRecibidasLogo++;
      sleep(Duration(seconds: 2));
      return sesionesRecibidasLogo;
    }
  }

  sesionesNecesariasPsic(Paciente paciente) {
    int sesionesRecibidasPsic = 0;
    while (Paciente().habilidadPsic > 100) {
      print("${Paciente().nombre} necesita sesiones de Psicologo");
      Paciente().habilidadPsic += 10;
      sesionesRecibidasPsic++;
      sleep(Duration(seconds: 2));
      return sesionesRecibidasPsic;
    }
  }

  sesionesNecesariasMotriz(Paciente paciente) {
    int sesionesRecibidasMotriz = 0;
    while (Paciente().habilidadMotriz > 100) {
      print("${Paciente().nombre} necesita sesiones de Fisioterapia");
      Paciente().habilidadMotriz += 10;
      sesionesRecibidasMotriz++;
      sleep(Duration(seconds: 2));
      return sesionesRecibidasMotriz;
    }
  }
}
