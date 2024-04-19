import 'package:mysql1/src/results/row.dart';

import '../Funcionamiento/Mother_class.dart';

class Profesional extends Motherclass {
  int? idProfesional;
  int? idProfesion;
  String? nombre;
  String? profesion;
  String? usuario;
  String? password;

  @override
  String? primaryKey;

  @override
  String? tableName;

  @override
  campos() {}

  @override
  fromMap(ResultRow row) {}
}
