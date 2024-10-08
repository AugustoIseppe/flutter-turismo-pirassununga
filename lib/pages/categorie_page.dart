import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_turismo_pirassununga/pages/home_page.dart';
import 'package:projeto_turismo_pirassununga/pages/itens_categoria_page.dart';
import 'package:projeto_turismo_pirassununga/service/sectur_pira_service.dart';

class TesteCategoriaEita extends StatefulWidget {
  const TesteCategoriaEita({super.key});

  @override
  State<TesteCategoriaEita> createState() => _TesteCategoriaEitaState();
}

class _TesteCategoriaEitaState extends State<TesteCategoriaEita> {
  final SecturPiraService _secturPiraService = SecturPiraService();
  String firstWord(String word) {
    return word.substring(0, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade300,
                      Colors.white,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Material(
                        elevation: 8,
                        shape: const CircleBorder(),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          icon: const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Categorias",
                        style: GoogleFonts.dmSerifDisplay(
                          textStyle: const TextStyle(
                            fontSize: 40,
                            height: 1.1,
                            letterSpacing: 1,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FutureBuilder(
                future: _secturPiraService.listarCategoria(),
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
                      //data["result"][index]["localfoto1"]
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
                        // final data = snapshot.data!["result"];
                        final data = snapshot.data ?? [];
                        return Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 0,
                                    crossAxisSpacing: 0,
                                    childAspectRatio: 1.5),
                            // scrollDirection: Axis.vertical,
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              // final titleLeading = snapshot.data!["result"]
                              //     [index]["categorianome"];
                              // firstWord(titleLeading);
                              // Coloque aqui o conteúdo do item do GridView
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ItensCategoriaPage(
                                        categoriaId: data[index]["categoriaid"]
                                            .toString(),
                                        nome: data[index]["categorianome"],
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  elevation: 2,
                                  shape: const LinearBorder(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: index % 2 == 1
                                            ? Colors.grey.shade200
                                            : Colors.white),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          data[index]["categorianome"],
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                  }
                }),
          ],
        ),
      ),
    );
  }
}
