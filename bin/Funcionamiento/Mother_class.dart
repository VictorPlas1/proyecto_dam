//Clase Madre donde va a estar la parte comun para todas las clases
import 'Database.dart';
import 'package:mysql1/mysql1.dart';

abstract class Motherclass {
  abstract String? tableName;
  abstract String? primaryKey;

  campos();
  fromMap(ResultRow row);

  insertar() async {
    var conn = await Database().conexion();
    String listaCampos = campos().keys.join(",");
    List valores = campos().values.toList();
    String interrogantes = valores.map((e) => "?").join(",");
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

  obtener(int? id) async {
    var conn = await Database().conexion();
    try {
      var resultado = await conn
          .query('SELECT * FROM $tableName WHERE $primaryKey = ?', [id]);
      var registro = fromMap(resultado.first);
      return registro;
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }

  all() async {
    var conn = await Database().conexion();

    try {
      var resultado = await conn.query('SELECT * FROM $tableName');
      List registros = resultado.map((row) => fromMap(row)).toList();
      return registros;
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }
}
