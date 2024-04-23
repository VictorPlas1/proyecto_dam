import 'dart:io';
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
        await Profesional().login();
        Profesional().menuInicioProfesional();
        break;
      case 4:
        await Paciente().login();
        Paciente().menuInicioPaciente();

        break;
      case 5:
        Profesional().ubicacion;
        inicioAPP();
        break;
      case 6:
        Profesional().curriculum;
        inicioAPP();
        break;
    }
  }
}
