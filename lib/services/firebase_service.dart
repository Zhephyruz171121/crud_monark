import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore baseDatos = FirebaseFirestore.instance;

Future<List> getAlumnos() async {
  List alumnos = [];
  await baseDatos.collection('AlumnosMK01').get().then((querySnapshot) {
    querySnapshot.docs.forEach((element) {
      alumnos.add(element.data());
    });
  });
  return alumnos;
}

Future<void> addAlumno(List datosAlumno) async {
  await baseDatos.collection('AlumnosMK01').add({
    'Nombre': datosAlumno[0],
    'ApellidoPaterno': datosAlumno[1],
    'ApellidoMaterno': datosAlumno[2],
    'CURP': datosAlumno[3],
    'Domicilio': datosAlumno[4],
    'Telefono': datosAlumno[5],
    'Correo': datosAlumno[6],
    'FechaNacimiento': datosAlumno[7],
  });
}
