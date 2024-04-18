import 'package:mysql1/mysql1.dart';

class Database {
  //Propiedades
  final String _host = 'localhost';
  final int _port = 3306;
  final String _user = 'root';

  //Metodos
  Future<MySqlConnection> conexion() async {
    var setting = new ConnectionSettings(
      host: this._host,
      port: this._port,
      user: this._user,
      db: 'damdb',
    );

    return await MySqlConnection.connect(setting);
  }

  instalacion() async {
    var setting = new ConnectionSettings(
      host: this._host,
      port: this._port,
      user: this._user,
    );
    var conn = await MySqlConnection.connect(setting);
    try {
      await _crearProyectoDAM(conn);
      await _crearTablaPaciente(conn);
      await _crearTablaProfesional(conn);
      await _crearTablaCita(conn);

      await conn.close();
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }

  _crearProyectoDAM(conn) async {
    await conn.query('CREATE DATABASE IF NOT EXISTS ProyectoDAM');
    await conn.query('USE ProyectoDAM');
    print('conectado a Base de Datos');
  }

  _crearTablaPaciente(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS usuarios (
          idpaciene INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
          nombre VARCHAR (50) NOT NULL  UNIQUE,
          contrasena VARCHAR (10)NOT NULL,
          correo VARCHAR (50) NOT NULL,
          edad INT,
          genero VARCHAR (10),
          servicios VARCHAR (50),
          proximaCita VARCHAR(20)

          )''');

    print('tabla usuarios creada');
  }

  _crearTablaProfesional(conn) async {
    await conn.query(''' CREATE TABLE IF NOT EXISTS mascotas(
          idprofesional INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
          idprofesion INT NOT NULL,
          nombre VARCHAR(50) NOT NULL,
          profesion VARCHAR(50) NOT NULL,
          usuario VARCHAR(50) NOT NULL,
          password VARCHAR(20)
          )''');
    print("Tabla mascota creada");
  }

  _crearTablaCita(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS citas(
      idcita INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      idusuario INT NOT NULL,
      nombre VARCHAR(50),
      servicio VARCHAR (50),
      fecha TIME (10)
      )''');
    print("Tabla citas creada");
  }
}
