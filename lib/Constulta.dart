
import 'package:crud_monark/DataBase.dart';
import 'package:flutter/material.dart';

class Constulta extends StatelessWidget {
  var MySQL = SqlDatabase();
  List<String> datosAlumno = [];
  var results = [];
  List<AlumnoItem> rows = [];

  Constulta({super.key});

  _cargarConsulta() async {
    results = await MySQL.consultaEstandar();

    for (var i = 0; i < results.length; i++) {
      datosAlumno.add(results[i]['id'].toString());
      datosAlumno.add(results[i]['nombre']);
      datosAlumno.add(results[i]['apellidoPaterno']);
      datosAlumno.add(results[i]['apellidoMaterno']);
      datosAlumno.add(results[i]['curp']);
      datosAlumno.add(results[i]['domicilio']);
      datosAlumno.add(results[i]['telefono']);
      datosAlumno.add(results[i]['correo']);
      datosAlumno.add(results[i]['fechaNacimiento'].toString());
      rows.add(AlumnoItem(
          id: results[i]['id'].toString(),
          nombre: results[i]['nombre'],
          apellidoPaterno: results[i]['apellidoPaterno'],
          apellidoMaterno: results[i]['apellidoMaterno'],
          curp: results[i]['curp'],
          domicilio: results[i]['domicilio'],
          telefono: results[i]['telefono'],
          correo: results[i]['correo'],
          fechaNacimiento: results[i]['fechaNacimiento']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mi Aplicación'),
        ),
        body: Center(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                  child: DataTable(columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Apellido Paterno')),
                DataColumn(label: Text('Apellido Materno')),
                DataColumn(label: Text('CURP')),
                DataColumn(label: Text('Domicilio')),
                DataColumn(label: Text('Telefono')),
                DataColumn(label: Text('Correo')),
                DataColumn(label: Text('Fecha de Nacimiento')),
              ], rows: [
                for (var i = 0; i < rows.length; i++)
                  DataRow(cells: [
                    DataCell(Text(rows[i].getId)),
                    DataCell(Text(rows[i].getNombre)),
                    DataCell(Text(rows[i].getApellidoPaterno)),
                    DataCell(Text(rows[i].getApellidoMaterno)),
                    DataCell(Text(rows[i].getCurp)),
                    DataCell(Text(rows[i].getDomicilio)),
                    DataCell(Text(rows[i].getTelefono)),
                    DataCell(Text(rows[i].getCorreo)),
                    DataCell(Text(rows[i].getFechaNacimiento)),
                  ]),
              ])),
              ElevatedButton(
                onPressed: () {
                  _cargarConsulta();
                },
                child: const Text('Cargar consulta'),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class AlumnoItem {
  final String id;
  final String nombre;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String curp;
  final String domicilio;
  final String telefono;
  final String correo;
  final String fechaNacimiento;

  AlumnoItem(
      {required this.id,
      required this.nombre,
      required this.apellidoPaterno,
      required this.apellidoMaterno,
      required this.curp,
      required this.domicilio,
      required this.telefono,
      required this.correo,
      required this.fechaNacimiento});
  get getId => id;
  get getNombre => nombre;
  get getApellidoPaterno => apellidoPaterno;
  get getApellidoMaterno => apellidoMaterno;
  get getCurp => curp;
  get getDomicilio => domicilio;
  get getTelefono => telefono;
  get getCorreo => correo;
  get getFechaNacimiento => fechaNacimiento;
  @override
  String toString() {
    return 'Alumno{id: $id, nombre: $nombre, apellidoPaterno: $apellidoPaterno, apellidoMaterno: $apellidoMaterno, curp: $curp, domicilio: $domicilio, telefono: $telefono, correo: $correo, fechaNacimiento: $fechaNacimiento}';
  }
}
