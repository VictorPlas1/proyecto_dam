import 'package:mysql1/src/results/row.dart';
import 'dart:io';
import 'ExamenPaciente.dart';
import '../Funcionamiento/Database.dart';
import '../Funcionamiento/App.dart';

import '../Funcionamiento/Mother_class.dart';

class Paciente extends Motherclass {
  int? idpaciente;
  String? nombre;
  String? password;
  String? usuario;
  var habilidadlogo;
  var habilidadpsic;
  var habilidadmotriz;

  // GETTER Y SETTER
  get getIdPaciente => this.idpaciente;

  set setIdPaciente(idPaciente) => this.idpaciente = idPaciente;

  get getNombre => this.nombre;

  set setNombre(nombre) => this.nombre = nombre;

  get getPassword => this.password;

  set setPassword(password) => this.password = password;

  get getUsuario => this.usuario;

  set setUsuario(usuario) => this.usuario = usuario;

  get getHabilidalogo => this.habilidadlogo;

  set setHabilidalogo(habilidalogo) => this.habilidadlogo = habilidalogo;

  get getHabilidadpsic => this.habilidadpsic;

  set setHabilidadpsic(habilidadpsic) => this.habilidadpsic = habilidadpsic;

  get getHabilidadmotriz => this.habilidadmotriz;

  set setHabilidadmotriz(habilidadmotriz) =>
      this.habilidadmotriz = habilidadmotriz;

  @override
  String? primaryKey = "idpaciente";
  @override
  String? tableName = "pacientes";

  @override
  Map? campos() => {
        "nombre": nombre,
        "password": password,
        "usuario": usuario,
        "habilidadlogo": habilidadlogo,
        "habilidadpsic": habilidadpsic,
        "habilidadmotriz": habilidadmotriz,
      };
  @override
  fromMap(ResultRow row) => Paciente().fromMap(row);
  Paciente();
  Paciente.fromMap(ResultRow map) {
    idpaciente = map['idpaciente'];
    nombre = map['nombre'];
    password = map['password'];
    usuario = map['usuario'];
    habilidadlogo = map['habilidadlogo'];
    habilidadpsic = map['habilidadpsic'];
    habilidadmotriz = map['habilidadmotriz'];
  }

  insertarPaciente() async {
    stdout.writeln("Introduce tu nombre:");
    nombre = stdin.readLineSync() ?? "e";
    stdout.writeln("Introuce un nombre de usuario");
    usuario = stdin.readLineSync() ?? "e";
    stdout.writeln("Elige una contraseña");
    password = stdin.readLineSync() ?? "e";
    stdout.writeln(
        "Para poder dar valorar tus habilidades,le vamos a pasar un cuestinario");
    habilidadlogo = Examen().obtenerPuntuacionLogo();
    habilidadpsic = Examen().obtenerPuntuacioPsico();
    habilidadmotriz = Examen().obtenerPuntuacionMotriz();

    await insertar();
    App().inicioAPP();
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
    stdout.writeln('Introduce tu nombre de usuario');
    nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu constraseña');
    password = stdin.readLineSync();
    var resultado = await loginPaciente();
    if (resultado == false) {
      stdout.writeln('Tu nombre de usuario o contraseña son incorrectos');
      App().inicioAPP();
    } else {
      menuInicioPaciente(resultado);
    }
  }

  menuInicioPaciente(Paciente paciente) async {
    int? opcion;
    do {
      stdout.writeln('''Bienvenido $nombre
    ¿Que opcion desea elegir?
    1 - Ver tus sesiones necesarias
    2 - Ver factura a pagar
    3 - Recibir tratamientos
    4 -Salir
    ''');
      String respuesta = stdin.readLineSync() ?? "e";
      opcion = parsearOpcion(respuesta);
    } while (cuatroOpciones(opcion));
    switch (opcion) {
      case 1:
        Examen().sesionesNecesariasLogo(paciente);
        Examen().sesionesNecesariasPsic(paciente);
        Examen().sesionesNecesariasMotriz(paciente);
        await menuInicioPaciente(paciente);
      case 2:
        stdout.writeln('''Calculando factura...''');
        sleep(Duration(seconds: 1));
        stdout.writeln("...");
        sleep(Duration(seconds: 1));
        Examen().verFactura(paciente);
        await menuInicioPaciente(paciente);
      case 3:
        Examen().recibirTratamiento(paciente);
        await menuInicioPaciente(paciente);
        break;
      case 4:
        stdout.writeln("Adios");
        sleep(Duration(seconds: 1));
        await App().inicioAPP();
    }
  }

  //FUNCIONES HERRAMIENTA
  bool cuatroOpciones(var opcion) =>
      opcion == null &&
      opcion != 1 &&
      opcion != 2 &&
      opcion != 3 &&
      opcion != 4;

  int? parsearOpcion(String respuesta) => int.tryParse(respuesta);
}
