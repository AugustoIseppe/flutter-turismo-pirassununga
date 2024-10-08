import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_turismo_pirassununga/models/infos_local.dart';
import 'package:projeto_turismo_pirassununga/pages/detalhes_page.dart';
import 'package:projeto_turismo_pirassununga/service/sectur_pira_service.dart';

class RestaurantesPage extends StatefulWidget {
  const RestaurantesPage({super.key});

  @override
  State<RestaurantesPage> createState() => _RestaurantesPageState();
}

class _RestaurantesPageState extends State<RestaurantesPage> {
  final SecturPiraService _secturPiraService = SecturPiraService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 64, 124, 150),
        foregroundColor: Colors.white,
        title: const Text(
          "Restaurantes",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FutureBuilder(
            future: _secturPiraService.listarRestaurantes(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return Center(
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                          strokeWidth: 5.0,
                        ),
                      ),
                    ),
                  );
                default:
                  //data["result"][index]["localnome"]
                  //data["result"][index]["localfoto1"]
                  if (snapshot.hasError) {
                    return Container(
                      color: Colors.amber,
                      child:
                          const Center(child: Text("Erro ao carregar dados")),
                    );
                  } else {
                    final List<InfosLocal> data = snapshot.data ?? [];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: SizedBox(
                            height: 30,
                            // color: Colors.green,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            "● ",
                                            style: TextStyle(
                                                color: Colors.amber,
                                                fontSize: 15),
                                          ),
                                          // SizedBox(
                                          //   width: 5,
                                          // ),
                                          Text(
                                            "${data.length.toString()} resultados encontrados",
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.amber.shade700,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: const Icon(
                                              Icons.filter_alt,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Details(details: data[index].toMap()),
                                    ),
                                  );
                                },
                                child: Card(
                                  color: Colors.white,
                                  shape: const ContinuousRectangleBorder(),
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 13, right: 8, bottom: 5, left: 8),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              height: 150,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.network(
                                                  "http://${dotenv.env["HOST"]}/assets/uploads/${data[index].localfoto1}",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const Positioned(
                                              top: 10,
                                              right: 15,
                                              child: Icon(
                                                Icons.favorite,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Positioned(
                                              top: 10,
                                              left: 15,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white70,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5, left: 2),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors
                                                            .orange.shade500,
                                                        size: 18,
                                                      ),
                                                      Text(
                                                        "8.5",
                                                        style: GoogleFonts
                                                            .amarante(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 15,
                                                          letterSpacing: 0.0,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                // mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    data[index].localnome,
                                                    style: GoogleFonts.amarante(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 1,
                                                  ),
                                                  Row(
                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      const Icon(
                                                        Icons.location_on,
                                                        size: 14,
                                                        color: Colors.grey,
                                                      ),
                                                      Text(
                                                        "${data[index].localcidade}, São Paulo",
                                                        style: GoogleFonts
                                                            .amarante(
                                                          fontSize: 12,
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        // const SizedBox(height: 100,)
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        // const SizedBox(height: 40,),
                      ],
                    );
                  }
              }
            },
          ),
        ],
      ),
    );
  }
}
