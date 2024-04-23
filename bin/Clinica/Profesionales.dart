import 'dart:math';

import 'package:mysql1/src/results/row.dart';
import 'dart:io';
import '../Funcionamiento/Mother_class.dart';
import '../Funcionamiento/Database.dart';
import '../Funcionamiento/App.dart';
import 'Paciente.dart';

class Profesional extends Motherclass {
  int? idProfesional;
  int? idProfesion;
  String? nombre;
  String? profesion;
  String? usuario;
  String? password;
//Getter y Setter
  int? get getIdProfesional => this.idProfesional;
  set setIdProfesional(int? idProfesional) =>
      this.idProfesional = idProfesional;
  get getIdProfesion => this.idProfesion;
  set setIdProfesion(idProfesion) => this.idProfesion = idProfesion;
  get getNombre => this.nombre;
  set setNombre(nombre) => this.nombre = nombre;
  get getProfesion => this.profesion;
  set setProfesion(profesion) => this.profesion = profesion;
  get getUsuario => this.usuario;
  set setUsuario(usuario) => this.usuario = usuario;
  get getPassword => this.password;
  set setPassword(password) => this.password = password;
  @override
  String? primaryKey = "idProfesional";
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
  fromMap(ResultRow row) => Profesional().fromMap(row);
  Profesional();
  Profesional.fromMap(ResultRow map) {
    idProfesional = map['idProfesional'];
    idProfesion = map['idProfesion'];
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

    insertar();
  }

  loginProfesional() async {
    var conn = await Database().conexion();
    try {
      var resultado = await conn
          .query('SELECT * FROM profesionales WHERE nombre = ?', [this.nombre]);
      Profesional profesional = Profesional.fromMap(resultado.first);
      if (this.password == profesional.password) {
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

  menuInicioProfesional() {
    stdout.writeln('''Bienvenido ${nombre} 
    ¿Que opcion desea elegir
    1 - Ver Pacientes
    2 - Ver sueldo acumulado}''');
    var opcion = stdin.readLineSync() ?? "e";
    var respuesta = int.tryParse(opcion);
    switch (respuesta) {
      case 1:
        Paciente().verPacientes();
        break;
      case 2:
        verSueldo();
        break;
    }
  }

  verSueldo() {}

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
    final random = Random();
    final frases = [
      "Lo sentimos, necesitamos este tipo de profesionales ahora mismo",
      "Necesitamos un profesional con su perfil"
    ];
    return frases[random.nextInt(frases.length)];
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
}
