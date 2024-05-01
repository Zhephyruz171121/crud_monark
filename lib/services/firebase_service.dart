import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Crea la instancia con la base de datos y la asigna a una variable
// de tipo FirebaseFirestore, la cual se obtiene de la librería cloud_firest  ore
FirebaseFirestore baseDatos = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

// Función que obtiene los datos de la colección AlumnosMK01
// y los almacena en una lista
// es decir, la consulta general de todos los alumnos
Future<List> getAlumnos() async {
  List alumnos = [];
  await baseDatos.collection('AlumnosMK01').get().then((querySnapshot) {
    querySnapshot.docs.forEach((element) {
      alumnos.add(element.data());
    });
  });
  return alumnos;
}

// Función que agrega un alumno a la colección AlumnosMK01
// recibe una lista con los datos del alumno
// y los almacena en la base de datos
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

/// Función que busca un alumno en la colección AlumnosMK01
/// recibe el campo y el valor a buscar
/// y devuelve una lista con los datos del alumno
/// que coincida con el valor del campo
Future<List> buscarAlumnos(String campo, String valor) async {
  List alumnos = [];
  try {
    await baseDatos
        .collection('AlumnosMK01')
        .where(campo, isEqualTo: valor)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        alumnos.add(element.data());
      });
    });
  } catch (e) {
    //print("Error al buscar alumnos: $e");
  }
  return alumnos;
}

/// Funcion que registra usuarios utilizando el servicio de autenticación de
/// Firebase mediante el correo y la contraseña del usuario que se desea registrar

Future<void> registrarUsuario(String email, String password, String nombre,
    String apellidos, String rango) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Después de registrar al usuario con éxito, almacenamos la información adicional en Firestore
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(userCredential.user!.uid).set({
      'Nombre': nombre,
      'Apellidos': apellidos,
      'Rango': rango,
    });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('La contraseña proporcionada es demasiado débil.');
    } else if (e.code == 'email-already-in-use') {
      print('La cuenta ya existe para ese correo electrónico.');
    }
  } catch (e) {
    print(e);
  }
}

/// Funcion que inicia sesión utilizando el servicio de autenticación de
/// Firebase mediante el correo y la contraseña del usuario que se registro
/// validando su existencia y que coincida con el registro en la base de datos

Future<UserCredential?> iniciarSesion(String email, String password) async {
  try {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  } on FirebaseAuthException catch (e) {
    print(e);
    return null;
  }
}

/// Funcion que cierra la sesión del usuario actual

Future<void> cerrarSesion() async {
  try {
    await auth.signOut();
  } catch (e) {
    print(e);
  }
}

Future<String?> obtenerRangoUsuario(String uid) async {
  try {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return (documentSnapshot.data() as Map<String, dynamic>)['Rango'];
  } catch (e) {
    print(e);
    return null;
  }
}
