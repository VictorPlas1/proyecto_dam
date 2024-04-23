import 'package:mysql1/src/results/row.dart';
import 'dart:io';
import '../Examen/ExamenPaciente.dart';
import '../Funcionamiento/Database.dart';
import '../Funcionamiento/App.dart';

import '../Funcionamiento/Mother_class.dart';

class Paciente extends Motherclass {
  int? idPaciente;
  String? nombre;
  String? password;
  String? usuario;
  var habilidaLogo;
  var habilidadPsic;
  var habilidadMotriz;
  //Getter y Setter

  @override
  String? primaryKey = "idPaciente";
  @override
  String? tableName = "pacientes";

  @override
  Map? campos() => {
        "nombre": nombre,
        "password": password,
        "usuario": usuario,
        "habilidadLogo": habilidaLogo,
        "habilidadPsic": habilidadPsic,
        "habilidadMotriz": habilidadMotriz
      };
  @override
  fromMap(ResultRow row) => Paciente().fromMap(row);
  Paciente();
  Paciente.fromMap(ResultRow map) {
    idPaciente = map['idpaciente'];
    nombre = map['nombre'];
    password = map['password'];
    usuario = map['usuario'];

    habilidaLogo = map['habilidadLogo'];
    habilidadPsic = map['habilidadPsic'];
    habilidadMotriz = map['habilidadMotiz'];
  }

  insertarPaciente() {
    stdout.writeln("Introduce tu nombre:");
    nombre = stdin.readLineSync() ?? "e";
    stdout.writeln("Introuce un nombre de usuario");
    usuario = stdin.readLineSync() ?? "e";
    stdout.writeln("Elige una contraseña");
    password = stdin.readLineSync() ?? "e";
    stdout.writeln(
        "Para poder dar valor a tus habilidades,le vamos a pasar un cuestinario");
    habilidaLogo = Examen().obtenerPuntuacionLogo();
    habilidadPsic = Examen().obtenerPuntuacioPsico();
    habilidadMotriz = Examen().obtenerPuntuacionMotriz();
    stdout.writeln("Paciente insertado correctamente");
    insertar();
  }

  loginPaciente() async {
    var conn = await Database().conexion();
    try {
      var resultado = await conn
          .query('SELECT * FROM pacientes WHERE nombre = ?', [this.nombre]);
      Paciente paciente = Paciente.fromMap(resultado.first);
      if (this.password == paciente.password) {
        return paciente;
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
    Paciente paciente = new Paciente();
    stdout.writeln('Introduce tu nombre de usuario');
    paciente.nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu constraseña');
    paciente.password = stdin.readLineSync();
    var resultado = await Paciente().loginPaciente();
    if (resultado == false) {
      stdout.writeln('Tu nombre de usuario o contraseña son incorrectos');
      App().inicioAPP();
    } else {
      menuInicioPaciente();
    }
  }

  menuInicioPaciente() {
    stdout.writeln('''Bienvenido ${nombre} 
    ¿Que opcion desea elegir
    1 - Ver tus sesiones necesarias
    2 - Ver factura a pagar
    }''');
    var opcion = stdin.readLineSync() ?? "e";
    var respuesta = int.tryParse(opcion);
    switch (respuesta) {
      case 1:
        break;
      case 2:
        verFactura();
        break;
    }
  }

  verFactura() {
    stdout.writeln("El importe total de tu Factura es:");
  }

  verPacientes() async {
    var conn = await Database().conexion();

    try {
      var resultado = await conn.query('SELECT * FROM pacientes');
      List<Paciente> pacientes =
          resultado.map((row) => Paciente.fromMap(row)).toList();
      return pacientes;
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }
}
