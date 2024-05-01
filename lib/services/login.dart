import 'package:crud_monark/services/firebase_service.dart';
import 'package:flutter/material.dart';

/// Primera version de la interfaz de inicio de secion de usuario
/// con animaciones de carga.
/// La interfaz contiene un [Scaffold] con un [AppBar] y un [Column]
/// que contiene un [TextField] para el correo y dos [AnimatedContainer]
/// con animaciones de carga.
/// El [TextField] tiene un [controller] para el correo y un [decoration]
/// con un [labelText] y un [border].
/// Los [AnimatedContainer] tienen un [duration] de 1 segundo y un [width]
/// y [height] que cambian de 0 a 200.
/// Los [AnimatedContainer] tienen un [color] rojo y verde respectivamente.
/// Los [AnimatedContainer] tienen un [child] con un [Center] y un [Text]
/// con un mensaje de carga.
/// Los [AnimatedContainer] tienen un [alignment] para centrar el contenido.
/// Los [AnimatedContainer] tienen un [curve] para la animación.
/// Los [AnimatedContainer] tienen un [repeat] para la animación.
/// Los [AnimatedContainer] tienen un [reverse] para la animación.
/// Los [AnimatedContainer] tienen un [builder] para la animación.
/// Los [AnimatedContainer] tienen un [animation] para la animación.
/// Los [AnimatedContainer] tienen un [opacity] para la animación.
/// Los [AnimatedContainer] tienen un [value] para la animación.
/// Los [AnimatedContainer] tienen un [vsync] para la animación.
/// Los [AnimatedContainer] tienen un [state] para la animación.
/// Los [AnimatedContainer] tienen un [initState] para la animación.
/// Los [AnimatedContainer] tienen un [dispose] para la animación.
/// Los [AnimatedContainer] tienen un [build] para la animación.
/// Los [AnimatedContainer] tienen un [child] para la animación.
/// Ademas de la animaciones se añadio un boton para llamar al metodo de iniciar
/// secion den tro del archivo firebase_service.dart

class LoginEMC extends StatefulWidget {
  @override
  _LoginEMCState createState() => _LoginEMCState();
}

class _LoginEMCState extends State<LoginEMC>
    with SingleTickerProviderStateMixin {
  TextEditingController _correoController = TextEditingController();
  TextEditingController _contrasenaController = TextEditingController();
  TextEditingController _confirmarContraControler = TextEditingController();
  TextEditingController _nombreControler = TextEditingController();
  TextEditingController _apellidosControler = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  String mensajevacio = "";
  String mensajeError = "Las contraseñas ingresadas no coinciden";

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de usuario'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _opacityAnimation.value,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.grey[300],
                      child: Container(
                          color: Colors.grey[200],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label:
                                        Text("Ingresa tu correo electronico"),
                                  ),
                                  controller: _correoController,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: TextField(
                                  controller: _contrasenaController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("Ingresa una nueva contraseña"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: TextField(
                                  controller: _confirmarContraControler,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("confirma la contraseña"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: TextField(
                                  controller: _nombreControler,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("Ingresa tu nombre"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: TextField(
                                  controller: _apellidosControler,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text("Ingresa tus apellidos")),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(40),
                                child: ElevatedButton.icon(
                                    onPressed: () {
                                      if (_confirmarContraControler.text ==
                                          _contrasenaController.text) {
                                        setState(() {
                                          mensajevacio =
                                              "Usuario Registrado con exito";
                                        });
                                        registrarUsuario(
                                            _correoController.text,
                                            _contrasenaController.text,
                                            _nombreControler.text,
                                            _apellidosControler.text,
                                            "Usuario");
                                      } else {
                                        setState(() {
                                          mensajevacio = mensajeError;
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.add),
                                    label: const Text("Añadir usuario")),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(mensajevacio),
                              ),
                            ],
                          )),
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '|  Power By GensenTech  |  Instituto Tecnologico Superior de Uruapan 2024  |',
                  style: TextStyle(fontSize: 10.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
