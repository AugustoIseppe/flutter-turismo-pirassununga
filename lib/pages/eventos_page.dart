import 'package:flutter/material.dart';
import 'package:projeto_turismo_pirassununga/dummy/dummy_eventos.dart';
import 'package:projeto_turismo_pirassununga/models/eventos.dart';
import 'package:projeto_turismo_pirassununga/pages/detalhes_eventos_page.dart';

class EventosPage extends StatefulWidget {
  const EventosPage({super.key});

  @override
  State<EventosPage> createState() => _EventosPageState();
}

class _EventosPageState extends State<EventosPage> {
  final List<ModeloEventos> loadedEventos = dummyEventos;

  Color _colorFaixaEtaria(int faixaEtaria) {
    if (faixaEtaria >= 18) {
      return Colors.black;
    } else if (faixaEtaria >= 16 && faixaEtaria < 18) {
      return Colors.red;
    } else if (faixaEtaria >= 14 && faixaEtaria < 16) {
      return Colors.orange;
    } else if (faixaEtaria >= 12 && faixaEtaria < 14) {
      return Colors.yellow;
    } else if (faixaEtaria >= 10 && faixaEtaria < 12) {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }

  String _shortenDescription(String description, int maxLength) {
    if (description.length > maxLength) {
      return '${description.substring(0, maxLength)}...';
    } else {
      return description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: const Text(
          'Eventos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        // separatorBuilder: (context, index) => const Padding(
        //   padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        //   child: Divider(
        //     color: Colors.black,
        //   ),
        // ),
        controller: PageController(viewportFraction: 0.9, initialPage: 1),
        itemCount: loadedEventos.length,
        itemBuilder: (context, index) {
          return SizedBox(
            // width: 400,
            height: 300,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.white, width: 2)),
              elevation: 10,
              child: Column(
                children: [
                  Image.asset(
                    loadedEventos[index].imagem,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                  ),
                  SizedBox(
                    // color: Colors.grey.shade200,
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.arrow_drop_down_circle),
                          title: Text(
                            loadedEventos[index].nome,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                          subtitle: Text(
                            loadedEventos[index].local,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 12,
                                overflow: TextOverflow.clip),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_month,
                                    size: 16,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    loadedEventos[index].data,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              // const SizedBox(
                              //   width: 10,
                              // ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    size: 16,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    loadedEventos[index].horario,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              loadedEventos[index].faixaEtaria > 10
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: _colorFaixaEtaria(
                                            loadedEventos[index].faixaEtaria),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Center(
                                          child: Text(
                                            loadedEventos[index]
                                                .faixaEtaria
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Center(
                                          child: Text(
                                            'Livre',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Text(
                      _shortenDescription(loadedEventos[index].descricao, 250),
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 12),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: FilledButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventosDetails(
                                    listEventos: loadedEventos[index]),
                              ),
                            );
                          },
                          child: const Text('Detalhes'),
                        ),
                      ),
                      // ElevatedButton(
                      //   // textColor: const Color(0xFF6200EE),
                      //   onPressed: () {
                      //     // Perform some action
                      //   },
                      //   child: const Text(''),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
