import 'dart:async';
import 'package:mysql1/mysql1.dart';

class SqlDatabase {
  late final conn;

  SqlDatabase() {
    _ConectarBD();
  }

  Future _ConectarBD() async {
    try {
      conn = await MySqlConnection.connect(ConnectionSettings(
        host: 'Localhost',
        port: 3306,
        user: 'root',
        db: 'controlescolar',
        password: 'Helix117yami',
      ));
      print('Connected to database');
    } catch (e, stackTrace) {
      print('Failed to execute query: $e');
      print('Stack trace: $stackTrace');
    }
  }

  Future consultaSQL(String consulta) async {
    try {
      var results = await conn.query(consulta);
      return results;
    } catch (e, stackTrace) {
      print('Failed to execute query: $e');
      print('Stack trace: $stackTrace');
    }
  }

  Future<List> consultaEstandar() async {
    var results;
    try {
      print('Consultando...');
      results = await conn.query('SELECT * FROM controlescolar.alumnos;');
      print(results);
    } catch (e, stackTrace) {
      print('Failed to execute query: $e');
      print('Stack trace: $stackTrace');
    }
    return results;
  }

  Future<void> eliminarRegistro(int id) async {
    try {
      var results = await conn.query('DELETE FROM alumnos WHERE id = ?', [id]);
      // Use the 'results' variable here if needed
    } catch (e, stackTrace) {
      print('Failed to execute query: $e');
      print('Stack trace: $stackTrace');
    }
  }
}
