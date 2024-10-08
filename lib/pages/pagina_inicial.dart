import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_turismo_pirassununga/pages/favorite_page.dart';
import 'package:projeto_turismo_pirassununga/pages/home_page.dart';
import 'package:projeto_turismo_pirassununga/pages/mapa_pirassununga_page.dart';
import 'package:projeto_turismo_pirassununga/pages/pesquisa_page.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    PesquisaPage(),
    FavoritePage(),
    MapaPirassunungaPage(),
  ];
  int _selectedIndex = 0; //New
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // fixedColor: Colors.black,
        backgroundColor: const Color.fromRGBO(153, 44, 75, 1),
        currentIndex: _selectedIndex,
        unselectedItemColor: const Color.fromRGBO(153, 44, 75, 1),
        selectedItemColor: const Color.fromRGBO(153, 44, 75, 1),
        onTap: _onItemTapped,
        selectedLabelStyle:
            GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold),
        elevation: 0,
        iconSize: 27,
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.search),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Ionicons.heart,
            ),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.location),
            label: 'Localização',
          ),
        ],
      ),
    );
  }
}
