import 'package:crud_monark/Busqueda.dart';
import 'package:crud_monark/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Clase que crea la pantalla de consulta de alumnos
/// con una interfaz que contiene una [AppBar] y un [Container]
/// que contiene un [FutureBuilder] que obtiene los datos de la base de datos
/// y los muestra en una [GridView] con tarjetas de [Card] que contienen
/// un [ListTile] con el nombre, apellido paterno y un [Icon] de persona.
/// Cada tarjeta tiene un [onTap] que redirige a la pantalla de detalles
/// del alumno.
/// La pantalla de detalles del alumno es un [Scaffold] con un [AppBar]
/// y un [Container] que contiene un [SingleChildScrollView] con un [Table]
/// que muestra los datos del alumno en una tabla con un [TableRow] para cada dato.
/// La tabla tiene un [border] con un [TableBorder] para los bordes de las celdas.
/// El [Container] tiene un [decoration] con una imagen de fondo.
/// La pantalla de consulta de alumnos tiene un [AppBar] con un [IconButton]
/// que redirige a la pantalla de búsqueda de alumnos.
class ConsultaFire extends StatefulWidget {
  @override
  _ConsultaFireState createState() => _ConsultaFireState();
}

class _ConsultaFireState extends State<ConsultaFire> {
  List<String> order = [
    'Nombre',
    'ApellidoPaterno',
    'ApellidoMaterno',
    'CURP',
    'FechaNacimiento',
    'Domicilio',
    'Telefono',
    'Correo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabla de alumnos de Firebase'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Busqueda(),
                ),
              );
            },
          ),
          const SizedBox(width: 60), // Espacio de 20 píxeles a la derecha
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/ElementosGraficos/4.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
            future: getAlumnos(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: snapshot.data?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Número de columnas
                    crossAxisSpacing:
                        10, // Espacio entre las tarjetas en la dirección horizontal
                    mainAxisSpacing:
                        10, // Espacio entre las tarjetas en la dirección vertical
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context)
                          .size
                          .height, // Altura fija de la tarjeta
                      child: Card(
                        color: Colors.green[50],
                        child: Center(
                          // Añade este widget
                          child: ListTile(
                            title: Text(snapshot.data?[index]['Nombre']),
                            subtitle:
                                Text(snapshot.data?[index]['ApellidoPaterno']),
                            leading: const Icon(Icons.person),
                            //trailing: const Icon(Icons.arrow_forward),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Scaffold(
                                    appBar: AppBar(
                                      title: Text(
                                          'Detalles del alumno ${snapshot.data?[index]['Nombre']}',
                                          style: const TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      centerTitle: true,
                                    ),
                                    body: Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "lib/ElementosGraficos/11.jpeg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          child: Card(
                                            color: const Color.fromARGB(
                                                244, 97, 202, 207),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Table(
                                                border: TableBorder.symmetric(
                                                    inside: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                )),
                                                children: order.map((key) {
                                                  var item = snapshot
                                                      .data?[index][key];
                                                  return TableRow(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Center(
                                                          child: Text(
                                                            key,
                                                            style:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 25.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Center(
                                                          child: Text(
                                                            item.toString(),
                                                            style:
                                                                const TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        23.0,
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })),
      ),
    );
  }
}
