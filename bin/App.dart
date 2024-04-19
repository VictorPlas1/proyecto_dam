import 'dart:io';
import 'Database.dart';

class App {
  inicioAPP() {
    Database().conexion();
    stdout.writeln('''Bienvenido a Clinica Sanitaria Victor
    ¿Qué opción desea elegir?
    1- Registrar Sanitario
    2 - Registar Paciente
    3 - Log in Sanitario
    4 - Log in Paciente
    5 - Informacion de contacto
    6 - Trabaja con nosotros''');
  }
}
