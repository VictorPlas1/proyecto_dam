//Clase Madre donde va a estar la parte comun para todas las clases
import 'Database.dart';

abstract class Motherclass {
  abstract String? tableName;
  abstract String? primaryKey;

  campos();

  insertar() async {
    var conn = await Database().conexion();
    String listaCampos = campos().keys.join(",");
    List valores = campos().values.toList();
    String interrogantes = campos().map((e) => "?").join(",");
    try {
      await conn.query(
          'INSERT INTO $tableName ($listaCampos) VALUES($interrogantes) ',
          valores);

      print('Registro insertado correctamente');
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }
}
