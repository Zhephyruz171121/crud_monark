import 'package:crud_monark/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingUpPage extends StatefulWidget {
  @override
  _SingUpPage createState() => _SingUpPage();
}

class _SingUpPage extends State<SingUpPage> {
  TextEditingController _usuarioController = TextEditingController();
  TextEditingController _contrasenaController = TextEditingController();

  void iniciarSesionUsuario() async {
    String email = _usuarioController.text;
    String password = _contrasenaController.text;

    UserCredential? userCredential = await iniciarSesion(email, password);
    if (userCredential != null) {
      // El inicio de sesión fue exitoso
      print('Inicio de sesión exitoso');
      String? rango = await obtenerRangoUsuario(userCredential.user!.uid);
      if (rango == 'Administrador') {
        // Aquí puedes redirigir al usuario a la página de administrador, por ejemplo
        Navigator.pushReplacementNamed(context, '/main');
      } else {
        // Aquí puedes redirigir al usuario a la página principal, por ejemplo
        Navigator.pushReplacementNamed(context, '/screen5');
      }
    } else {
      // El inicio de sesión falló
      print('Inicio de sesión falló');
      // Aquí puedes mostrar un mensaje de error al usuario, por ejemplo
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inicio de sesión',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Icon(
                Icons.person,
                size: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _usuarioController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre de usuario',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _contrasenaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  iniciarSesionUsuario();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(180, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 22,
                  ),
                ),
                child: const Text('Iniciar sesión'),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('¿No tienes cuenta?')),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/screen3');
                },
                style: ElevatedButton.styleFrom(
                  //fixedSize: const Size(180, 50),
                  backgroundColor: Colors.white,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                child: const Text('registrate aqui'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
