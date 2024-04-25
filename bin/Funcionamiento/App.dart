import 'dart:io';
import 'dart:math';
import '../Clinica/Paciente.dart';
import 'Database.dart';
import '../Clinica/Profesionales.dart';

class App {
  inicioAPP() async {
    await Database().conexion();
    stdout.writeln('''Bienvenido a Clinica Sanitaria Victor
    ¿Qué opción desea elegir?
    1- Registrar Sanitario
    2 - Registar Paciente
    3 - Log in Sanitario
    4 - Log in Paciente
    5 - Informacion de contacto
    6 - Trabaja con nosotros''');
    var opcion = stdin.readLineSync() ?? "e";
    var respuesta = int.tryParse(opcion);
    switch (respuesta) {
      case 1:
        await Profesional().insertarProfesional();
        inicioAPP();
        break;
      case 2:
        await Paciente().insertarPaciente();
        inicioAPP();
        break;
      case 3:
        Profesional profesional = await Profesional().login();
        Profesional().menuInicioProfesional(profesional);
        break;
      case 4:
        Paciente paciente = await Paciente().login();
        Paciente().menuInicioPaciente(paciente);

        break;
      case 5:
        ubicacion();
        inicioAPP();
        break;
      case 6:
        curriculum();
        inicioAPP();
        break;
    }
  }

  ubicacion() {
    stdout.writeln(''' Indica la ciudad donde te interesa la información
    1 - Madrid
    2 - Talavera de la Reina
    3 - Toledo''');
    var opcion = stdin.readLineSync() ?? "e";
    var respuesta = int.tryParse(opcion);
    switch (respuesta) {
      case 1:
        stdout.writeln('''La clinica de Madrid está ubicada en: 
       Calle Antonio Leyva , 35
       El contacto es : 6362589''');
        break;
      case 2:
        stdout.writeln(''' La clinica de Talavera está ubicada en :
        Calle San Francisco ,14
        El contacto es : 95623145''');
        break;
      case 3:
        stdout.writeln('''La clinica de Toledo está ubicada en :
        Calle Angel del Alcazar , 200
        El contacto es : 96321456''');
    }
  }

  curriculum() {
    stdout.writeln('''Indica tu profesion 
  1 - Logopeda
  2 - Psicologo
  3 - Fisioterapeuta ''');
    var opcion = stdin.readLineSync() ?? "e";
    var respuesta = int.tryParse(opcion);
    switch (respuesta) {
      case 1:
        fraseAzar();
        break;
      case 2:
        fraseAzar();
        break;
      case 3:
        fraseAzar();
        break;
    }
  }

  fraseAzar() {
    var random = Random();
    List frases = [
      "Lo sentimos, no  necesitamos este tipo de profesionales ahora mismo",
      " !! ENHORABUENA !!Necesitamos un profesional con su perfil",
    ];
    stdout.writeln(frases[random.nextInt(frases.length)]);
  }
}
