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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void iniciarSesionUsuario() async {
    String email = _usuarioController.text;
    String password = _contrasenaController.text;

    if (email.isEmpty && password.isEmpty) {
      mostrarSnackBar('Por favor, llena todos los campos');
      return;
    } else if (!email.contains('@')) {
      mostrarSnackBar('Por favor, ingresa un correo válido');
      return;
    } else if (password.length < 8 && password.length > 1) {
      mostrarSnackBar('La contraseña debe tener al menos 8 caracteres');
      return;
    } else if (password.length > 16) {
      mostrarSnackBar('La contraseña debe tener menos de 16 caracteres');
      return;
    } else if (password.contains(' ')) {
      mostrarSnackBar('La contraseña no debe contener espacios');
      return;
    } else if (email.isEmpty) {
      mostrarSnackBar('Por favor, ingresa un correo');
      return;
    } else if (password.isEmpty) {
      mostrarSnackBar('Por favor, ingresa una contraseña');
      return;
    }

    UserCredential? userCredential = await iniciarSesion(email, password);
    try {
      // El inicio de sesión fue exitoso
      mostrarSnackBar('Inicio de sesión exitoso');
      String? rango = await obtenerRangoUsuario(userCredential!.user!.uid);
      if (rango == 'Administrador') {
        // Aquí puedes redirigir al usuario a la página de administrador, por ejemplo
        mostrarSnackBar("Bienvenido administrador");
        Navigator.pushReplacementNamed(context, '/main');
      } else {
        // Aquí puedes redirigir al usuario a la página principal, por ejemplo
        Navigator.pushReplacementNamed(context, '/screen5');
        mostrarSnackBar('Bienvenido');
      }
    } on CustomAuthException catch (e) {
      mostrarSnackBar(e.message);
    }
  }

  void mostrarSnackBar(String mensaje) {
    final snackBar = SnackBar(
      content: Text(mensaje, style: const TextStyle(fontSize: 17)),
      backgroundColor: Colors.blue[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
        body: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/ElementosGraficos/3.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.height * 0.80,
              decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  )),
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
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
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
          ),
        ));
  }
}
