import 'package:flutter/material.dart';
import 'package:projeto_turismo_pirassununga/data/user_favorite.dart';
import 'package:projeto_turismo_pirassununga/pages/pagina_inicial.dart';
import 'package:provider/provider.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserFavorites(),
        )
      ],
      child: MaterialApp(
        title: 'SecturPira Mobile',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const HomePage(),
        home: const PaginaInicial(),

        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
