import 'dart:async';

// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto_turismo_pirassununga/models/eventos.dart';
import 'package:projeto_turismo_pirassununga/utils/mapa_pirassununga.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import 'package:social_media_buttons/social_media_button.dart';

class EventosDetails extends StatefulWidget {
  final ModeloEventos listEventos;
  const EventosDetails({
    super.key,
    required this.listEventos,
  });

  @override
  State<EventosDetails> createState() => _EventosDetailsState();
}

class _EventosDetailsState extends State<EventosDetails> {
  int activeIndex = 0;
  // bool isFavorite = false;

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

  @override
  Widget build(BuildContext context) {
    final data = widget.listEventos;
    // UserFavorites userFavorites = Provider.of(context);
    final Completer<GoogleMapController> controller =
        Completer<GoogleMapController>();
    //latitude            //longitude
    //-21.99674234912524, -47.427033597259324

    final lat = data.latitude;
    final latitudePaserd = double.tryParse(lat);
    final long = data.longitude;
    final longitudePaserd = double.tryParse(long);
    CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(latitudePaserd!, longitudePaserd!),
      zoom: 13.4746,
      bearing: 0,
      tilt: 1.0,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(
          data.nome,
          style: GoogleFonts.lato(),
        ),
        centerTitle: true,
        // actions: [
        // IconButton(

        //   onPressed: () {
        //     if (!userFavorites.locaisFavoritos.any(
        //         (local) => local['localid'] == widget.details['localid'])) {
        //       userFavorites.adicionarLocalFavorito(widget.details);
        //     } else {
        //       userFavorites.removerLocalFavorito(widget.details);
        //     }
        //     Store.saveList(
        //         "savedLocaisFavoritos", userFavorites.locaisFavoritos);
        //   },
        //   icon: Icon(
        //     userFavorites.locaisFavoritos.any(
        //             (local) => local['localid'] == widget.details['localid'])
        //         ? Icons
        //             .favorite // Ícone preenchido quando o item está na lista de favoritos
        //         : Icons
        //             .favorite_border, // Ícone vazio quando o item não está na lista de favoritos
        //     color: userFavorites.locaisFavoritos.any(
        //             (local) => local['localid'] == widget.details['localid'])
        //         ? Colors
        //             .red // Cor vermelha quando o item está na lista de favoritos
        //         : Colors
        //             .black, // Cor preta quando o item não está na lista de favoritos
        //   ),
        // ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(
            //   height: 10,
            // ),
            // CarouselSlider(
            //   options: CarouselOptions(
            //     height: 350,
            //     viewportFraction: 0.8,
            //     autoPlay: true,
            //     disableCenter: false,
            //     scrollDirection: Axis.horizontal,
            //     enlargeCenterPage: true,
            //     enlargeStrategy: CenterPageEnlargeStrategy.height,
            //     pageSnapping: true,
            //     enableInfiniteScroll: true,
            //     onPageChanged: (index, reason) {
            //       setState(() {
            //         activeIndex = index;
            //       });
            //     },
            //   ),
            //   items: [
            //     data.imagem
            //   ]
            //       .map((item) => Padding(
            //             padding: const EdgeInsets.all(2.0),
            //             child: ClipRRect(
            //               borderRadius: BorderRadius.circular(8),
            //               child: Image.asset(
            //                 item,
            //                 fit: BoxFit.cover,
            //                 // height: 300,
            //               ),
            //             ),
            //           ))
            //       .toList(),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // const SizedBox(
            //   height: 3,
            // ),
            // Center(child: buildIndicator()),
            // const SizedBox(
            //   height: 15,
            // ),
            Image.asset(
              data.imagem,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              // height: 350,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.nome,
                    style: GoogleFonts.truculenta(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 14,
                        color: Colors.grey,
                      ),
                      Text(
                        "Pirassununga-SP",
                        style: GoogleFonts.lato(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sobre o evento",
                            style: GoogleFonts.truculenta(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            data.descricao,
                            style: GoogleFonts.lato(
                              color: Colors.grey[600],
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    if (data.descricao != "")
                      if (data.descricao != "")
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: SizedBox(
                                width: 260,
                                child: Text(
                                  '${data.local} - Rua ${data.rua}, ${data.bairro}, ${data.numero}',
                                  style: GoogleFonts.lato(
                                    color: Colors.grey[600],
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                    if (data.descricao != "") const Divider(),
                    if (data.descricao != "")
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.calendar_month,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              data.data,
                              style: GoogleFonts.lato(
                                color: Colors.grey[600],
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    if (data.data != "") const Divider(),
                    if (data.data != "")
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.access_time,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: SizedBox(
                              width: 260,
                              child: Text(
                                data.horario,
                                style: GoogleFonts.lato(
                                  color: Colors.grey[600],
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    const Divider(),
                    if (data.data != "")
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              data.telefone,
                              style: GoogleFonts.lato(
                                color: Colors.grey[600],
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    const Divider(),
                    if (data.data != "")
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              data.organizador,
                              style: GoogleFonts.lato(
                                color: Colors.grey[600],
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    const Divider(),
                    if (data.data != "")
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.category,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              data.categoria,
                              style: GoogleFonts.lato(
                                color: Colors.grey[600],
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    const Divider(),
                    if (data.data != "")
                      data.faixaEtaria > 10
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 8, bottom: 8),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  // mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            _colorFaixaEtaria(data.faixaEtaria),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Center(
                                          child: Text(
                                            data.faixaEtaria.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2.0),
                                      child: Text(
                                        'Não recomendado para pessoas menores de ${data.faixaEtaria} anos'
                                            .toString(),
                                        style: GoogleFonts.lato(
                                          color: Colors.grey[600],
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
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
                                  Text(
                                    ' - Não há restrições de idade para este evento'
                                        .toString(),
                                    style: GoogleFonts.lato(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                    const Divider(),
                    MapaPirassununga(
                      controller: controller,
                      kGooglePlex: kGooglePlex,
                      markerLat: latitudePaserd,
                      markerLong: longitudePaserd,
                      title: data.nome,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 5,
        effect: ExpandingDotsEffect(
          dotWidth: 8,
          dotHeight: 5,
          activeDotColor: Colors.blue,
          dotColor: Colors.grey.shade300,
          spacing: 2,
        ),
      );
}
