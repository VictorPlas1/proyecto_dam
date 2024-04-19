import 'package:mysql1/src/results/row.dart';

import '../Funcionamiento/Mother_class.dart';

class Cita extends Motherclass {
  int? idCita;
  int? idusuario;
  String? nombre;
  String? servicio;
  DateTime? fecha;

  @override
  String? primaryKey;

  @override
  String? tableName;

  @override
  campos() {}

  @override
  fromMap(ResultRow row) {}
}
