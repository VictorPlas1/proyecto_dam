import 'package:mysql1/src/results/row.dart';

import '../Funcionamiento/Mother_class.dart';

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
  String? primaryKey;

  @override
  String? tableName;

  @override
  campos() {}

  @override
  fromMap(ResultRow row) {}
}
