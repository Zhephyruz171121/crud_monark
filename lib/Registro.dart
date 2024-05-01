import 'package:crud_monark/services/firebase_service.dart';
import 'package:flutter/material.dart';

/// Clase que crea la pantalla de registro de alumnos
/// con una interfaz que contiene campos de texto para ingresar
/// los datos del alumno y un botón para registrar al alumno.
/// La pantalla de registro es un [StatefulWidget] que contiene un [Scaffold]
/// con un [AppBar] y un [Container] que contiene un [Column] con campos de texto
/// para ingresar los datos del alumno y un botón para registrar al alumno.
/// Los campos de texto tienen un [controller] para asignar el valor del campo
/// a una variable y un [decoration] con un [border] y un [labelText].
/// El botón tiene un [ElevatedButton] con un [onPressed] que registra al alumno
/// y un [onLongPress] que limpia los campos de texto.
/// El botón tiene un estilo personalizado con un [fixedSize] para el ancho y alto,
/// un [shape] para el borde y un [textStyle] para el texto.
/// El [Column] tiene un [mainAxisAlignment] para centrar los campos de texto
/// y el botón.
/// El [Container] tiene un [decoration] con una imagen de fondo.
/// La pantalla de registro tiene un [mensaje] que se muestra en la parte inferior
/// de la pantalla para indicar si el alumno fue registrado o si faltan campos
/// por llenar.
/// La pantalla de registro tiene un [datosAlumno] que almacena los datos del alumno
/// y un [mensaje] que se muestra en la parte inferior de la pantalla.
/// La pantalla de registro tiene un [nombreController], [apellidoPaternoController],
/// [apellidoMaternoController], [curpController], [domicilioController],
/// [telefonoController], [correoController] y [fechaNacimientoController]
/// que almacenan el valor de los campos de texto.
/// La pantalla de registro tiene las funciones [_registrarAlumno], [_limpiarCampos]
/// y [_camposIsEmpty] que registran al alumno, limpian los campos de texto y
/// verifican si los campos de texto están vacíos, respectivamente.
class Registro extends StatefulWidget {
  //Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  List<String> datosAlumno = [];

  String mensaje = "";

  // Limpia los campos de texto
  TextEditingController nombreController = TextEditingController();

  TextEditingController apellidoPaternoController = TextEditingController();

  TextEditingController apellidoMaternoController = TextEditingController();

  TextEditingController curpController = TextEditingController();

  TextEditingController domicilioController = TextEditingController();

  TextEditingController telefonoController = TextEditingController();

  TextEditingController correoController = TextEditingController();

  TextEditingController fechaNacimientoController = TextEditingController();

  _registrarAlumno() async {
    datosAlumno = [
      nombreController.text,
      apellidoPaternoController.text,
      apellidoMaternoController.text,
      curpController.text,
      domicilioController.text,
      telefonoController.text,
      correoController.text,
      fechaNacimientoController.text,
    ];
    addAlumno(datosAlumno);
    //print("registrado");
  }

  _limpiarCampos() {
    nombreController.clear();
    apellidoPaternoController.clear();
    apellidoMaternoController.clear();
    curpController.clear();
    domicilioController.clear();
    telefonoController.clear();
    correoController.clear();
    fechaNacimientoController.clear();
    datosAlumno.clear();
  }

  _camposIsEmpty() {
    if (nombreController.text.isEmpty ||
        apellidoPaternoController.text.isEmpty ||
        apellidoMaternoController.text.isEmpty ||
        curpController.text.isEmpty ||
        domicilioController.text.isEmpty ||
        telefonoController.text.isEmpty ||
        correoController.text.isEmpty ||
        fechaNacimientoController.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro para nuevos alumnos'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/ElementosGraficos/5.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: const Color.fromARGB(183, 255, 255, 255),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: TextField(
                                controller:
                                    nombreController, // Assign the controller
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nombre',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: TextField(
                                controller:
                                    apellidoPaternoController, // Assign the controller
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Apellido Paterno',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: TextField(
                                controller:
                                    apellidoMaternoController, // Assign the controller
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Apellido Materno',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: TextField(
                                controller:
                                    curpController, // Assign the controller
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'CURP',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: const Color.fromARGB(183, 255, 255, 255),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: TextField(
                                controller:
                                    domicilioController, // Assign the controller
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Domicilio',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: TextField(
                                controller:
                                    telefonoController, // Assign the controller
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Telefono',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: TextField(
                                controller: correoController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Correo Electronico',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: TextField(
                                controller: fechaNacimientoController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Fecha de nacimiento (dd/mm/aaaa)',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  padding: const EdgeInsets.all(10),
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onLongPress: () {
                                _limpiarCampos();
                              },
                              onPressed: () {
                                if (_camposIsEmpty() != true) {
                                  _registrarAlumno();
                                  _limpiarCampos();
                                  mensaje = "Alumno registrado";
                                } else {
                                  mensaje =
                                      "Favor de llenar todos los campos antes de guardar";
                                }
                              },
                              icon: const Icon(Icons.add),
                              label: const Text('Registrar nuevo alumno'),
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(300, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(mensaje),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
