import 'package:crud_monark/Consultas/Resultado%20de%20busqueda.dart';
//import 'package:crud_monark/services/firebase_service.dart';
import 'package:flutter/material.dart';

final List<String> datosAlumno = [
  'Nombre',
  'ApellidoPaterno',
  'ApellidoMaterno',
  'CURP',
  'FechaNacimiento',
  'Domicilio',
  'Telefono',
  'Correo'
];

class Busqueda extends StatefulWidget {
  @override
  _BusquedaState createState() => _BusquedaState();
}

class _BusquedaState extends State<Busqueda> {
  TextEditingController busquedaController = TextEditingController();
  String selectedDato = '';

  @override
  void initState() {
    super.initState();
    selectedDato = datosAlumno[0]; // Inicializa con el primer valor
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busqueda de alumnos'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/ElementosGraficos/12.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Color.fromARGB(240, 255, 255, 255),
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .15,
                child: TextField(
                  controller: busquedaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText:
                        'Captura de datos [Nombre, Apellido Paterno, Apellido Materno, CURP, Fecha de Nacimiento (AAAA-MM-DD), Domicilio, Teléfono, Correo]',
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                color: const Color.fromARGB(240, 255, 255, 255),
                child: DropdownButton<String>(
                  value: selectedDato,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDato = newValue!;
                    });
                  },
                  items:
                      datosAlumno.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {
                    String busqueda = busquedaController.text;
                    print(
                        "Seleccion el campo $selectedDato con el valor de $busqueda");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultadoBusqueda(
                          selectedDato,
                          busquedaController.text,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(350, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('Consultar Alumnos'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
