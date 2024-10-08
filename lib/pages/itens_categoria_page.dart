import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_turismo_pirassununga/pages/detalhes_page.dart';
import 'package:projeto_turismo_pirassununga/service/sectur_pira_service.dart';

class ItensCategoriaPage extends StatefulWidget {
  final String categoriaId;
  final String nome;

  const ItensCategoriaPage({
    super.key,
    required this.categoriaId,
    required this.nome,
  });

  @override
  State<ItensCategoriaPage> createState() => _ItensCategoriaPageState();
}

class _ItensCategoriaPageState extends State<ItensCategoriaPage> {
  final SecturPiraService _secturPiraService = SecturPiraService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.nome,
          style:
              const TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 64, 124, 150),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          FutureBuilder(
            future:
                _secturPiraService.listarLocalPorCategoria(widget.categoriaId),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return const Center(
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  );
                default:
                  if (snapshot.hasError) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.error_sharp,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Ops...Aldo deu errado!',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900),
                                ),
                                SizedBox(
                                  width: 290,
                                  child: Text(
                                    'Não conseguimos localizar a página que você está procurando. Por favor, tente novamente mais tarde',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    final data = snapshot.data ?? [];
                    if (data.isEmpty) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.search_off,
                                        size: 100,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Não há dados cadastrados nesta categoria",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Column(
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
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color:
                                                        Colors.amber.shade700,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
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
                                              Details(details: data[index]),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      color: Colors.white,
                                      shape: const ContinuousRectangleBorder(),
                                      elevation: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 13,
                                            right: 8,
                                            bottom: 5,
                                            left: 8),
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  height: 150,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Image.network(
                                                      "http://${dotenv.env["HOST"]}/assets/uploads/${data[index]["localfoto1"]}",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        data[index]
                                                            ["localnome"],
                                                        style: GoogleFonts
                                                            .amarante(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 1,
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.location_on,
                                                            size: 14,
                                                            color: Colors.grey,
                                                          ),
                                                          Text(
                                                            "${data[index]["localnome"]}, São Paulo",
                                                            style: GoogleFonts
                                                                .amarante(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                        ),
                      );
                    }
                  }
              }
            },
          ),
        ],
      ),
    );
  }
}
