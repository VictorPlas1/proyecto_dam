import 'package:mysql1/src/results/row.dart';

import '../Funcionamiento/Mother_class.dart';

class Factura extends Motherclass {
  int? idfactura;
  var precioSesion;
  var total = 40;
  var sesionesLogo;
  var sesionesPsico;
  var sesionesMotriz;

  @override
  String? primaryKey = 'idfactura';

  @override
  String? tableName = 'facturas';

  @override
  Map? campos() => {
        "total": total,
        "sesionesLogo": sesionesLogo,
        "sesionesPsico": sesionesPsico,
        "sesionesMotriz": sesionesMotriz
      };

  @override
  fromMap(ResultRow row) => Factura().fromMap(row);
  Factura();
  Factura.fromMap(ResultRow map) {
    total = map['total'];
    sesionesLogo = map['sesionesLogo'];
    sesionesPsico = map['sesionesPsico'];
    sesionesMotriz = map['sesionesMotriz'];
  }
}
