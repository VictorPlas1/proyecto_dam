import 'App.dart';
import 'Database.dart';

main() async {
  await Database().instalacion();

  await App().inicioAPP();
}
