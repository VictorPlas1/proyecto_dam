import 'package:mysql1/mysql1.dart';

class Database {
  //Propiedades
  final String _host = 'localhost';
  final int _port = 3306;
  final String _user = 'root';

  //Metodos
  Future<MySqlConnection> conexion() async {
    var setting = ConnectionSettings(
      host: this._host,
      port: this._port,
      user: this._user,
      db: 'proyectodam',
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
    await conn.query('CREATE DATABASE IF NOT EXISTS proyectodam');
    await conn.query('USE proyectodam');
    print('conectado a Base de Datos');
  }

  _crearTablaPaciente(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS pacientes (
          idpaciene INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
          nombre VARCHAR (50) NOT NULL  UNIQUE,
          password VARCHAR (10)NOT NULL,
          correo VARCHAR (50) NOT NULL,
          edad INT,
          genero VARCHAR (10),
          servicios VARCHAR (50),
          proximaCita DATE

          )''');

    print('tabla pacientes creada');
  }

  _crearTablaProfesional(conn) async {
    await conn.query(''' CREATE TABLE IF NOT EXISTS profesionales(
          idprofesional INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
          idprofesion INT NOT NULL,
          nombre VARCHAR(50) NOT NULL,
          profesion VARCHAR(50) NOT NULL,
          usuario VARCHAR(50) NOT NULL,
          password VARCHAR(20)
          )''');
    print("Tabla profesional creada");
  }

  _crearTablaCita(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS citas(
      idcita INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      idusuario INT NOT NULL,
      nombre VARCHAR(50),
      servicio VARCHAR (50),
      fecha DATE 
      )''');
    print("Tabla citas creada");
  }

  _crearTablaFactura(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS facturas
    idfactura INT NOT NULL AUTO_INCREMENT,
    idpaciente INT,
    precio INT,
    total INT
     ''');
    print("Tabla facturas creada");
  }
}
