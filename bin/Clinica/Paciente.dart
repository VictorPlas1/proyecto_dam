import 'package:mysql1/src/results/row.dart';

import '../Funcionamiento/Mother_class.dart';

class Paciente extends Motherclass {
  int? idPaciente;
  String? nombre;
  String? password;
  String? usuario;
  int? edad;
  String? genero;
  String? servicios;
  String? proximaCita;
  int? habilidaLogo;
  int? habilidadPsic;
  int? habilidadMotriz;
  //Getter y Setter

  @override
  String? primaryKey = "idPaciente";
  @override
  String? tableName = "pacientes";
  @override
  Map? campos() => {
        "nombre": nombre,
        "password": password,
        "usuario": usuario,
        "edad": edad,
        "genero": genero,
        "servicios": servicios,
        "habilidadLogo": habilidaLogo,
        "habilidadPsic": habilidadPsic,
        "habilidadMotriz": habilidadMotriz
      };
  @override
  fromMap(ResultRow row) => Paciente().fromMap(row);
  Paciente();
  Paciente.fromMap(ResultRow map) {
    idPaciente = map['idpaciente'];
    nombre = map['nombre'];
    password = map['password'];
    usuario = map['usuario'];
    edad = map['edad'];
    genero = map['genero'];
    servicios = map['servicios'];
    habilidaLogo = map['habilidadLogo'];
    habilidadPsic = map['habilidadPsic'];
    habilidadMotriz = map['habilidadMotiz'];
  }
}
