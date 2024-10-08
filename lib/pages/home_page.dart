// ignore_for_file: unused_import
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_turismo_pirassununga/pages/bares_page.dart';
import 'package:projeto_turismo_pirassununga/pages/categorie_page.dart';
import 'package:projeto_turismo_pirassununga/pages/detalhes_page.dart';
import 'package:projeto_turismo_pirassununga/pages/eventos_page.dart';
import 'package:projeto_turismo_pirassununga/pages/hospedagem_page.dart';
import 'package:projeto_turismo_pirassununga/pages/lanchonetes_page.dart';
import 'package:projeto_turismo_pirassununga/pages/melhores_avaliados_page.dart';
import 'package:projeto_turismo_pirassununga/pages/pizzarias_page.dart';
import 'package:projeto_turismo_pirassununga/pages/principais_destinos_page.dart';
import 'package:projeto_turismo_pirassununga/pages/restaurantes_page.dart';
import 'package:projeto_turismo_pirassununga/service/sectur_pira_service.dart';
import 'package:projeto_turismo_pirassununga/widgets/wdgt_eventos.dart';
import 'package:projeto_turismo_pirassununga/utils/mapa_pirassununga.dart';
import 'package:projeto_turismo_pirassununga/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   print("RESULTADO: ${_resultados.length}");
  //   print("RESULTADO: ${_resultados}");

  // }

  final SecturPiraService _secturPiraService = SecturPiraService();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  //-21.99674234912524, -47.427033597259324
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-21.99674234912524, -47.427033597259324),
    zoom: 13.4746,
    bearing: 0,
    tilt: 1.0,
  );

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Turismo \nPirassununga",
          style: GoogleFonts.dmSerifDisplay(
            textStyle: const TextStyle(
              fontSize: 40,
              height: 1.1,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromRGBO(153, 44, 75, 1),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.19,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              padding: const EdgeInsets.only(
                  bottom: 85.0), // Ajuste o valor conforme necessário
            );
          },
        ),
      ),
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Column(
                  children: [
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   color: const Color.fromRGBO(153, 44, 75, 1),
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(bottom:15.0, top: 15.0),
                    //     child: Center(
                    //       child: Text(
                    //         "Turismo \nPirassununga",
                    //         style: GoogleFonts.dmSerifDisplay(
                    //           textStyle: const TextStyle(
                    //             fontSize: 40,
                    //             height: 1.1,
                    //             letterSpacing: 1,
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //         textAlign: TextAlign.center,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: Text(
                                "Categorias Populares",
                                style: GoogleFonts.dmSerifDisplay(
                                  textStyle: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const TesteCategoriaEita(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Ver todas..",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.amber[900],
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0,
                                    vertical: 0.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HospegademPage(),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Ionicons.business_outline,
                                          size: 50,
                                          color: Color.fromRGBO(153, 44, 75, 1),
                                        ),
                                        Text(
                                          "Hospedagem",
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(
                                                    153, 44, 75, 1),
                                                fontWeight: FontWeight.w500),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                // const SizedBox(
                                //   width: 20,
                                // ),

                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const BaresPage(),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Ionicons.beer_outline,
                                          size: 50,
                                          color: Color.fromRGBO(153, 44, 75, 1),
                                        ),
                                        Text(
                                          "Bares",
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(
                                                    153, 44, 75, 1),
                                                fontWeight: FontWeight.w500),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                // const SizedBox(
                                //   width: 20,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RestaurantesPage(),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Ionicons.restaurant_outline,
                                          size: 50,
                                          color: Color.fromRGBO(153, 44, 75, 1),
                                        ),
                                        Text(
                                          "Restaurantes",
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(
                                                    153, 44, 75, 1),
                                                fontWeight: FontWeight.w500),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                // const SizedBox(
                                //   width: 20,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LanchonetesPage(),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Ionicons.fast_food_outline,
                                          size: 50,
                                          color: Color.fromRGBO(153, 44, 75, 1),
                                        ),
                                        Text(
                                          "Lanchonetes",
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(
                                                    153, 44, 75, 1),
                                                fontWeight: FontWeight.w500),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PizzariasPage(),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Ionicons.pizza_outline,
                                          size: 50,
                                          color: Color.fromRGBO(153, 44, 75, 1),
                                        ),
                                        Text(
                                          "Pizzarias",
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(
                                                    153, 44, 75, 1),
                                                fontWeight: FontWeight.w500),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PizzariasPage(),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Ionicons.ice_cream_outline,
                                          size: 50,
                                          color: Color.fromRGBO(153, 44, 75, 1),
                                        ),
                                        Text(
                                          "Sorveterias",
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(
                                                    153, 44, 75, 1),
                                                fontWeight: FontWeight.w500),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: Text(
                                "Principais Destinos",
                                style: GoogleFonts.dmSerifDisplay(
                                  textStyle: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PrincipaisDestinosPage(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  "Ver todos..",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.amber[900],
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    FutureBuilder(
                        future: _secturPiraService.listarPrincipaisDestinos(),
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
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.blue),
                                      strokeWidth: 5.0,
                                    ),
                                  ),
                                ),
                              );
                            default:
                              //data["result"][index]["localnome"]
                              //data["result"][index]["localfoto1"]
                              if (snapshot.hasError) {
                                return const SizedBox(
                                  height: 200,
                                  width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Carregando dados..."),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                          backgroundColor: Colors.white,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                final data = snapshot.data ?? [];
                                return SizedBox(
                                  height: 240,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: GridView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        // Coloque aqui o conteúdo do item do GridView
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Details(
                                                      details: data[index]),
                                                ));
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: GridTile(
                                              footer: SizedBox(
                                                // height: 45,

                                                child: GridTileBar(
                                                  // trailing: Icon(Icons.favorite_border_outlined, color: Colors.white,),

                                                  title: Text(
                                                    "${data[index]["localnome"]}",
                                                    style: GoogleFonts
                                                        .dmSerifDisplay(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  subtitle: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 6.0),
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.location_on,
                                                          size: 12,
                                                          color: Colors.black54,
                                                        ),
                                                        Text(
                                                          "${data[index]["localcidade"]}, São Paulo",
                                                          style:
                                                              GoogleFonts.lato(
                                                            textStyle: const TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // trailing: Icon(Icons.save),
                                                  // backgroundColor: Colors.black38,
                                                  backgroundColor:
                                                      Colors.white54,
                                                ),
                                              ),
                                              // child: Image.network(
                                              //   networkImageUrl[0],
                                              //   fit: BoxFit.cover,
                                              // ),
                                              child: Image.network(
                                                "http://177.52.106.73/assets/uploads/${data[index]["localfoto1"]}",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing:
                                            5, // Define o número de colunas
                                        // Especifique outras configurações conforme necessário
                                      ),
                                    ),
                                  ),
                                );
                              }
                          }
                        }),

                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Text(
                            "Eventos",
                            style: GoogleFonts.dmSerifDisplay(
                              textStyle: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EventosPage(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              "Saiba mais...",
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.amber[900],
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Eventos(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Text(
                            "Melhores avaliados",
                            style: GoogleFonts.dmSerifDisplay(
                              textStyle: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MelhoresAvaliadosPage(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              "Ver todos..",
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.amber[900],
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                      future: _secturPiraService.listarMelhoresAvaliados(),
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.blue),
                                    strokeWidth: 5.0,
                                  ),
                                ),
                              ),
                            );
                          default:
                            if (snapshot.hasError) {
                              return const SizedBox(
                                height: 200,
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Carregando dados..."),
                                    SizedBox(height: 20),
                                    Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1,
                                        backgroundColor: Colors.white,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return Container(
                                color: Colors.green,
                                child: const Text(
                                  "Ainda não existem locais \ncadastrados para essa categoria",
                                  textAlign: TextAlign.center,
                                ),
                              );
                            } else {
                              final data = snapshot.data ?? [];
                              const int itemsToShow =
                                  4; // Número fixo de itens a exibir
                              const double itemHeight =
                                  200.0; // Altura fixa para cada item

                              // Calcula a altura total do GridView
                              final double gridHeight =
                                  (itemsToShow / 2).ceil() * itemHeight;

                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                    bottom: 0.0,
                                    top: 0.0),
                                child: SizedBox(
                                  height: gridHeight,
                                  child: GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4,
                                      childAspectRatio: 1,
                                    ),
                                    itemCount: itemsToShow,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Details(details: data[index]),
                                            ),
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: GridTile(
                                            footer: GridTileBar(
                                              title: Text(
                                                "${data[index]["localnome"]}",
                                                style:
                                                    GoogleFonts.dmSerifDisplay(
                                                  textStyle: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on,
                                                    size: 12,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    "${data[index]["localcidade"]}, São Paulo",
                                                    style: GoogleFonts.lato(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                              backgroundColor: Colors.black45,
                                            ),
                                            child: Image.network(
                                              "http://177.52.106.73/assets/uploads/${data[index]["localfoto1"]}",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }
                        }
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        children: [
                          Text(
                            "Localização",
                            style: GoogleFonts.dmSerifDisplay(
                              textStyle: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    //latitude            //longitude
                    //-21.99674234912524, -47.427033597259324
                    const SizedBox(
                      height: 10,
                    ),
                    MapaPirassununga(
                      controller: _controller,
                      kGooglePlex: _kGooglePlex,
                      markerLat: -21.99674234912524,
                      markerLong: -47.427033597259324,
                      title: 'Pirassununga',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
