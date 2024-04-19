import 'package:mysql1/src/results/row.dart';

import '../Funcionamiento/Mother_class.dart';

class Cita extends Motherclass {
  int? idCita;
  int? idusuario;
  String? nombre;
  String? servicio;
  DateTime? fecha;
  int? get getIdCita => this.idCita;
  // Getter y Setter
  set setIdCita(int? idCita) => this.idCita = idCita;
  get getIdusuario => this.idusuario;
  set setIdusuario(idusuario) => this.idusuario = idusuario;
  get getNombre => this.nombre;
  set setNombre(nombre) => this.nombre = nombre;
  get getServicio => this.servicio;
  set setServicio(servicio) => this.servicio = servicio;
  get getFecha => this.fecha;
  set setFecha(fecha) => this.fecha = fecha;

  @override
  String? primaryKey;

  @override
  String? tableName;

  @override
  campos() {}

  @override
  fromMap(ResultRow row) {}
}
