import 'Mother_class.dart';

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
}
