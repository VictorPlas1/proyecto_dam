import '../Tratamiento/Tratamiento.dart';

class Factura extends Tratamiento {
  int? idFactura;
  int? idPaciente;
  int? total;
  @override
  int idTratamiento = 0;
  @override
  String nombreTratamiento = [''] as String;
  @override
  int precio = 0;
}
