import 'package:crud_monark/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
  List<String> datosAlumno = [];

  // Limpia los campos de texto
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoPaternoController = TextEditingController();
  TextEditingController apellidoMaternoController = TextEditingController();
  TextEditingController curpController = TextEditingController();
  TextEditingController domicilioController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController correoController = TextEditingController();
  TextEditingController fechaNacimientoController = TextEditingController();

  Registro({super.key});

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
    print("registrado");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro para nuevos alumnos'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(10),
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
                                  labelText: 'Fecha de Nacimiento',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                              _registrarAlumno();
                            },
                            icon: const Icon(Icons.add),
                            label: const Text('Registrar nuevo alumno'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              textStyle: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
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
    );
  }
}
