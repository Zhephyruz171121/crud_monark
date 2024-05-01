import 'package:crud_monark/services/firebase_service.dart';
import 'package:flutter/material.dart';

/// La pantalla de búsqueda de alumnos es un [Scaffold] con un [AppBar]
/// y un [Container] que contiene un [Column] con un [TextField] para el campo
/// de búsqueda y un [DropdownButton] para el campo de búsqueda.
/// El [Column] tiene un [mainAxisAlignment] para centrar los elementos.
/// El [Container] tiene un [decoration] con una imagen de fondo.
/// El [TextField] tiene un [decoration] con un [labelText] y un [hintText]
/// para el campo de búsqueda.
/// El [DropdownButton] tiene un [value] para el campo de búsqueda y un [items]
/// con las opciones de búsqueda.
/// El [DropdownButton] tiene un [onChanged] para seleccionar el campo de búsqueda.
/// El [DropdownButton] tiene un [style] para el texto y un [icon] para el ícono.
/// El [DropdownButton] tiene un [underline] para el borde del botón.
/// El [DropdownButton] tiene un [elevation] para la elevación del botón.
/// El [DropdownButton] tiene un [isExpanded] para expandir el botón.
/// El [DropdownButton] tiene un [iconSize] para el tamaño del ícono.
/// Ademas al seleccionar el [ElevatedButton] se redirige a la pantalla de
/// [ResultadoBusqueda] con el campo y el dato de búsqueda.
/// La interfaz a la que se redirige es un [Scaffold] con un [AppBar] y un
/// [Container] que contiene un [Column] con un [FutureBuilder] que obtiene
/// los datos de la búsqueda y los muestra en una [GridView].
/// El funcionamiento de esde [GridView] es similar al de la pantalla de
/// [ConsultaFire].

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

class ResultadoBusqueda extends StatefulWidget {
  final String _campo;
  final String _dato;

  ResultadoBusqueda(this._campo, this._dato);

  @override
  _Pantalla createState() => _Pantalla();
}

class _Pantalla extends State<ResultadoBusqueda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Coincidencias con el campo ${widget._campo} y el dato ${widget._dato}'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: FutureBuilder(
                    future: (widget._campo != null &&
                            widget._campo
                                .isNotEmpty) // widget._campo != null && widget._campo.isNotEmpty
                        ? buscarAlumnos(widget._campo, widget._dato)
                        : Future.error('Campo vacío'),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          itemCount: snapshot.data?.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, // Número de columnas
                            crossAxisSpacing:
                                10, // Espacio entre las tarjetas en la dirección horizontal
                            mainAxisSpacing:
                                10, // Espacio entre las tarjetas en la dirección vertical
                          ),
                          itemBuilder: (context, index) {
                            return Card(
                              child: Center(
                                child: ListTile(
                                  title: Text(snapshot.data?[index]['Nombre']),
                                  subtitle: Text(
                                      snapshot.data?[index]['ApellidoPaterno'],
                                      style: const TextStyle(
                                        fontSize: 10,
                                      )),
                                  leading: const Icon(Icons.person),
                                  trailing: const Icon(Icons.arrow_forward),
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
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
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
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: Card(
                                                  color: const Color.fromARGB(
                                                      244, 97, 202, 207),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Table(
                                                      border:
                                                          TableBorder.symmetric(
                                                              inside:
                                                                  const BorderSide(
                                                        color: Colors.black,
                                                        width: 1.0,
                                                      )),
                                                      children:
                                                          order.map((key) {
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
                                                                    fontSize:
                                                                        25.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
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
                                                                  style: const TextStyle(
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
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
