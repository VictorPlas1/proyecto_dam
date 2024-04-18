import 'App.dart';
import 'Database.dart';

main() async {
  await Database().instalacion();

  App().inicioAPP();
}
