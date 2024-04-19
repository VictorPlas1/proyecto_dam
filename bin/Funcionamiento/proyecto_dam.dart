import 'App.dart';
import 'Database.dart';
import '../Examen/ExamenPaciente.dart';

main() async {
  await Database().instalacion();

  await App().inicioAPP();
  Examen().obtenerPuntuacion();
}
