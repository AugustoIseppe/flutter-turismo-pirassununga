// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_turismo_pirassununga/data/user_favorite.dart';
import 'package:projeto_turismo_pirassununga/pages/detalhes_page.dart';
// import 'package:project_secturpira_mobile/utils/store.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   Provider.of<UserFavorites>(context, listen: false)
  //       .carregarLocaisFavoritos();
  // }

  @override
  void initState() {
    super.initState();
    Provider.of<UserFavorites>(context, listen: false)
        .carregarLocaisFavoritos();
  }

  @override
  Widget build(BuildContext context) {
    UserFavorites userFavorites = Provider.of<UserFavorites>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 64, 124, 150),
        foregroundColor: Colors.white,
        elevation: 5,
        title: const Text(
          "Meus favoritos",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView.builder(
          // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 2,
          //   mainAxisSpacing: 3,
          //   crossAxisSpacing: 3,
          //   childAspectRatio: 0.7,
          // ),
          itemCount: userFavorites.locaisFavoritos.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> local = userFavorites.locaisFavoritos[index];
            return _buildLocalCard(local);
          },
        ),
      ),
    );
  }

  Widget _buildLocalCard(Map<String, dynamic> local) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Details(details: local),
              ));
        },
        child: Card(
          elevation: 3,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 130,
                height: 135,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  child: Image.network(
                    "http://177.52.106.73/assets/uploads/${local["localfoto1"]}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${local["localnome"]}",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w900),
                        ),
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "${local["localdescricao"]}, São Paulo",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 15,
                            color: Colors.grey,
                          ),
                          Text(
                            "${local["localcidade"]}, São Paulo",
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // trailing: Icon(Icons.save),
          // backgroundColor: Colors.black38,
        ),
        //  Image.network(
        //   "http://${Constants.ipConfig}/SecturPira/assets/uploads/${local["localfoto1"]}",
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}
