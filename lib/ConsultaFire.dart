import 'package:crud_monark/services/firebase_service.dart';
import 'package:flutter/material.dart';

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
        ),
        body: FutureBuilder(
            future: getAlumnos(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(snapshot.data?[index]['Nombre']),
                        subtitle:
                            Text(snapshot.data?[index]['ApellidoPaterno']),
                        leading: const Icon(Icons.person),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scaffold(
                                appBar: AppBar(
                                  title: Text(
                                      'Detalles del alumno ${snapshot.data?[index]['Nombre']}'),
                                ),
                                body: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Card(
                                      color: Colors.blue[100],
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Table(
                                          border: TableBorder.symmetric(
                                              inside: const BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          )),
                                          children: order.map((key) {
                                            var item =
                                                snapshot.data?[index][key];
                                            return TableRow(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child: Text(
                                                      key,
                                                      style: const TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child: Text(
                                                      item.toString(),
                                                      style: const TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16.0,
                                                      ),
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
                          );
                        });
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })));
  }
}
