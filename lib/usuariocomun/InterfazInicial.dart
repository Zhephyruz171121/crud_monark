import 'package:crud_monark/services/firebase_service.dart';
import 'package:flutter/material.dart';

class MenuUser extends StatefulWidget {
  @override
  _MenuUser createState() => _MenuUser();
}

class _MenuUser extends State<MenuUser> {
  final double ancho = 350;
  final double alto = 60;
  final double espacio = 25;

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
