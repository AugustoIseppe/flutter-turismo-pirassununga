import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_turismo_pirassununga/pages/eventos_page.dart';
import 'package:projeto_turismo_pirassununga/pages/favorite_page.dart';
import 'package:projeto_turismo_pirassununga/pages/mapa_pirassununga_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/pirassununga-sp.jpg'),
                    fit: BoxFit.fill),
              ),
              child: Text('')),
          ListTile(
            leading: const Icon(
              Ionicons.location,
              color: Colors.black,
              size: 20,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.black,
              size: 20,
            ),
            title: Text(
              'Localização',
              style: GoogleFonts.dmSerifDisplay(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            onTap: () {
              // Navegue para a tela de favoritos
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MapaPirassunungaPage()),
              );
            },
          ),
          Divider(
            color: Colors.grey[200],
          ),
          ListTile(
            leading: const Icon(
              Icons.event,
              color: Colors.black,
              size: 20,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.black,
              size: 20,
            ),
            title: Text(
              'Eventos',
              style: GoogleFonts.dmSerifDisplay(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            onTap: () {
              // Navegue para a tela de favoritos
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EventosPage()),
              );
            },
          ),
          Divider(
            color: Colors.grey[200],
          ),
          ListTile(
            leading: const Icon(
              Ionicons.heart_circle_outline,
              color: Colors.black,
              size: 20,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.black,
              size: 20,
            ),
            title: Text(
              'Favoritos',
              style: GoogleFonts.dmSerifDisplay(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            onTap: () {
              // Navegue para a tela de favoritos
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritePage()),
              );
            },
          ),
          Divider(
            color: Colors.grey[200],
          ),
        ],
      ),
    );
  }
}
