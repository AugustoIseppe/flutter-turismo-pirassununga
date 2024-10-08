import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto_turismo_pirassununga/data/user_favorite.dart';
import 'package:projeto_turismo_pirassununga/utils/mapa_pirassununga.dart';
import 'package:projeto_turismo_pirassununga/utils/store.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  final Map<String, dynamic> details;
  const Details({
    super.key,
    required this.details,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  int activeIndex = 0;
  // bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    UserFavorites userFavorites = Provider.of(context);
    final Completer<GoogleMapController> controller =
        Completer<GoogleMapController>();
    //latitude            //longitude
    //-21.99674234912524, -47.427033597259324

    final lat = widget.details["locallatitude"];
    final latitudePaserd = double.tryParse(lat);
    final long = widget.details["locallongitude"];
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
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        title: Text(
          widget.details["localnome"],
          style: GoogleFonts.lato(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (!userFavorites.locaisFavoritos.any(
                  (local) => local['localid'] == widget.details['localid'])) {
                userFavorites.adicionarLocalFavorito(widget.details);
              } else {
                userFavorites.removerLocalFavorito(widget.details);
              }
              Store.saveList(
                  "savedLocaisFavoritos", userFavorites.locaisFavoritos);
            },
            icon: Icon(
              userFavorites.locaisFavoritos.any(
                      (local) => local['localid'] == widget.details['localid'])
                  ? Icons
                      .favorite // Ícone preenchido quando o item está na lista de favoritos
                  : Icons
                      .favorite_border, // Ícone vazio quando o item não está na lista de favoritos
              color: userFavorites.locaisFavoritos.any(
                      (local) => local['localid'] == widget.details['localid'])
                  ? Colors
                      .red // Cor vermelha quando o item está na lista de favoritos
                  : Colors
                      .black, // Cor preta quando o item não está na lista de favoritos
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 350,
                viewportFraction: 0.8,
                autoPlay: true,
                disableCenter: false,
                scrollDirection: Axis.horizontal,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                pageSnapping: true,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              items: [
                "http://177.52.106.73/assets/uploads/${widget.details["localfoto1"]}",
                "http://177.52.106.73/assets/uploads/${widget.details["localfoto2"]}",
                "http://177.52.106.73/assets/uploads/${widget.details["localfoto3"]}",
                "http://177.52.106.73/assets/uploads/${widget.details["localfoto4"]}",
                "http://177.52.106.73/assets/uploads/${widget.details["localfoto5"]}",
              ]
                  .map((item) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                            // height: 300,
                          ),
                        ),
                      ))
                  .toList(),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            // const SizedBox(
            //   height: 3,
            // ),
            Center(child: buildIndicator()),
            // const SizedBox(
            //   height: 15,
            // ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.details["localnome"],
                    style: GoogleFonts.truculenta(
                        color: const Color.fromARGB(255, 64, 124, 150),
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
                        "${widget.details["localcidade"]}, ${widget.details["localestado"]}",
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
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sobre",
                      style: GoogleFonts.truculenta(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "${widget.details["localdescricao"]}",
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
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Card(
                color: Colors.white,
                elevation: 1,
                shape: const ContinuousRectangleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      if (widget.details["localenderecodescricao"] != null &&
                          widget.details["localenderecodescricao"] != "")
                        // const Divider(),
                        if (widget.details["localenderecodescricao"] != null &&
                            widget.details["localenderecodescricao"] != "")
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
                                    widget.details["localenderecodescricao"],
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
                      if (widget.details["localemail"] != null &&
                          widget.details["localemail"] != "")
                        const Divider(),
                      if (widget.details["localemail"] != null &&
                          widget.details["localemail"] != "")
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.mail,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                widget.details["localemail"],
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
                      if (widget.details["localwebsite"] != null &&
                          widget.details["localwebsite"] != "")
                        const Divider(),
                      if (widget.details["localwebsite"] != null &&
                          widget.details["localwebsite"] != "")
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.language,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: SizedBox(
                                width: 260,
                                child: Text(
                                  widget.details["localwebsite"],
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
                      if (widget.details["localtelefone"] != null &&
                          widget.details["localtelefone"] != "")
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
                                widget.details["localtelefone"],
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: SocialMediaButton.instagram(
                                onTap: () {
                                  final urlInstgram = Uri.parse(
                                      widget.details["localinstagram"]);
                                  _launchUrl(urlInstgram);
                                  print(widget.details["localinstagram"]);
                                },
                                size: 30,
                                color: Colors.pink,
                              ),
                            ),
                            GestureDetector(
                              child: SocialMediaButton.facebook(
                                onTap: () {
                                  final urlFacebook = Uri.parse(
                                      widget.details["localfacebook"]);

                                  _launchUrl(urlFacebook);
                                },
                                size: 30,
                                color: Colors.blue[900],
                              ),
                            ),
                            GestureDetector(
                              child: SocialMediaButton.whatsapp(
                                onTap: () {
                                  final urlWhatsApp = Uri.parse(
                                      'https://wa.me/${widget.details["localcelular"]}');
                                  _launchUrl(urlWhatsApp);
                                },
                                size: 30,
                                color: Colors.greenAccent[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: SizedBox(
                child: Text(
                  "Localização",
                  style: GoogleFonts.truculenta(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),

            MapaPirassununga(
              controller: controller,
              kGooglePlex: kGooglePlex,
              markerLat: latitudePaserd,
              markerLong: longitudePaserd,
              title: widget.details["localnome"],
            )
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
