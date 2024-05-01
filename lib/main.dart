import 'package:crud_monark/ConsultaFire.dart';
import 'package:crud_monark/services/firebase_service.dart';
import 'package:crud_monark/services/login.dart';
import 'package:crud_monark/services/loginAdmin.dart';
import 'package:crud_monark/services/singup.dart';
import 'package:crud_monark/usuariocomun/InterfazInicial.dart';
import 'package:flutter/material.dart';
import 'package:crud_monark/Registro.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/// Función principal que inicializa la aplicación y home del sistema
/// con las rutas de las pantallas de registro y consulta.
/// Aqui se inicializa Firebase y se llama a la función [runApp]
/// para iniciar la aplicación.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagina de inicio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Cambia la ruta de inicio a la ventana de registro
      home: SingUpPage(),
      routes: {
        '/signup': (context) => SingUpPage(),
        '/main': (context) => const MainPage(),
        '/screen1': (context) => Registro(),
        '/screen2': (context) => ConsultaFire(),
        '/screen3': (context) => LoginEMC(),
        '/screen4': (context) => LoginAdm(),
        '/screen5': (context) => MenuUser(),
      },
    );
  }
}

/// Clase que crea la pantalla principal del sistema con una interfaz
/// que contiene botones para acceder a las pantallas de registro y consulta
/// de alumnos.
/// La pantalla principal es un [StatelessWidget] que contiene un [Scaffold]
/// con un [AppBar] y un [Container] que contiene un [Column] con botones
/// para acceder a las pantallas de registro y consulta de alumnos.
/// Cada botón tiene un [ElevatedButton] con un [onPressed] que redirige
/// a la pantalla correspondiente.
/// Los botones tienen un estilo personalizado con un [fixedSize] para
/// el ancho y alto, un [shape] para el borde y un [textStyle] para el texto.
/// El [Column] tiene un [mainAxisAlignment] para centrar los botones.
/// El [Container] tiene un [decoration] con una imagen de fondo.

class MainPage extends StatelessWidget {
  final double ancho = 350;
  final double alto = 60;
  final double espacio = 25;
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Bienbenido al sistema Monark',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/ElementosGraficos/1.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/screen1');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(ancho, alto),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  child: const Text('Registro de alumnos'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: espacio),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/screen2');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(ancho, alto),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  child: const Text('Consulta de alumnos'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: espacio),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/screen4');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(ancho, alto),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  child: const Text('Registro de usuarios'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: espacio),
                child: ElevatedButton(
                  onPressed: () {
                    cerrarSesion();
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(ancho, alto),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  child: const Text('cerrar sesion'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
