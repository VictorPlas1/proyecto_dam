import 'package:mysql1/src/results/row.dart';
import 'dart:io';
import '../Funcionamiento/Mother_class.dart';
import '../Funcionamiento/Database.dart';
import '../Funcionamiento/App.dart';
import 'Paciente.dart';

class Profesional extends Motherclass {
  int? idprofesional;
  String? nombre;
  String? profesion;
  String? usuario;
  String? password;

  @override
  String? primaryKey = "idprofesional";
  @override
  String? tableName = "profesionales";

  @override
  Map? campos() => {
        "nombre": nombre,
        "profesion": profesion,
        "usuario": usuario,
        "password": password
      };

  @override
  fromMap(ResultRow row) => Profesional.fromMap(row);
  Profesional();
  Profesional.fromMap(ResultRow map) {
    idprofesional = map['idprofesional'];
    nombre = map['nombre'];
    profesion = map['profesion'];
    usuario = map['usuario'];
    password = map['password'];
  }

  insertarProfesional() async {
    stdout.writeln("Introduce tu nombre:");
    nombre = stdin.readLineSync() ?? "e";
    stdout.writeln("Introuce un nombre de usuario");
    usuario = stdin.readLineSync() ?? "e";
    stdout.writeln("Elige una contraseña");
    password = stdin.readLineSync() ?? "e";
    stdout.writeln("Indica tu profesion");
    profesion = stdin.readLineSync() ?? "e";
    await insertar();
  }

  loginProfesional() async {
    var conn = await Database().conexion();
    try {
      var resultado = await conn
          .query('SELECT * FROM profesionales WHERE nombre = ?', [nombre]);
      Profesional profesional = Profesional.fromMap(resultado.first);
      if (password == profesional.password) {
        return profesional;
      } else
        return false;
    } catch (e) {
      print(e);
      return false;
    } finally {
      await conn.close();
    }
  }

  login() async {
    stdout.writeln('Introduce tu nombre de usuario');
    nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu constraseña');
    password = stdin.readLineSync();
    var resultado = await loginProfesional();
    if (resultado == false) {
      stdout.writeln('Tu nombre de usuario o contraseña son incorrectos');
      App().inicioAPP();
    } else {
      menuInicioProfesional();
    }
  }

  menuInicioProfesional() async {
    stdout.writeln('''Bienvenido ${nombre} 
    ¿Que opcion desea elegir
    1 - Ver Pacientes
    2 - Ver sueldo acumulado''');
    var opcion = stdin.readLineSync() ?? "e";
    var respuesta = int.tryParse(opcion);
    switch (respuesta) {
      case 1:
        await Paciente().verPacientes();

        App().inicioAPP();
        break;
      case 2:
        verSueldo();
        break;
    }
  }

  verSueldo() {
    int sueldoDia = 83;
    DateTime now = DateTime.now();
    int dia = now.day;

    int sueldoAcumulado = sueldoDia * dia;
    stdout
        .writeln(''' Hoy es dia $dia , con un sueldo diario de $sueldoDia euros
    Has acumulado $sueldoAcumulado  euros''');
  }
}
