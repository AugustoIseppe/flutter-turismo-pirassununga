import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projeto_turismo_pirassununga/pages/eventos_page.dart';

class Eventos extends StatefulWidget {
  const Eventos({super.key});

  @override
  State<Eventos> createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 310,
          // viewportFraction: 0.8,autoPlayAnimationDuration: Duration(seconds: 1),
          // autoPlayInterval: Duration(seconds: 10),
          // viewportFraction: 1,
          autoPlayCurve: Curves.linear,
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
          "assets/images/evento1.png",
          "assets/images/evento2.png",
          "assets/images/evento3.png",
          "assets/images/evento4.png",
        ]
            .map((item) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventosPage(),
                            ));
                      },
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
