import '../Tratamiento/Tratamiento.dart';

class Factura extends Tratamiento {
  int? idFactura;
  int? idPaciente;
  int? total;
  //Getter y Setter

  int? get getIdFactura => this.idFactura;
  set setIdFactura(int? idFactura) => this.idFactura = idFactura;
  get getIdPaciente => this.idPaciente;
  set setIdPaciente(idPaciente) => this.idPaciente = idPaciente;
  get getTotal => this.total;

  set setTotal(total) => this.total = total;
  @override
  int idTratamiento = 0;
  @override
  String nombreTratamiento = [''] as String;
  @override
  int precio = 0;
}
