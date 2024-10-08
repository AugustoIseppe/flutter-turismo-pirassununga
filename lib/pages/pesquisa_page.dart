import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_turismo_pirassununga/models/infos_local.dart';
import 'package:projeto_turismo_pirassununga/pages/detalhes_page.dart';
import 'package:projeto_turismo_pirassununga/service/sectur_pira_service.dart';
import 'package:validatorless/validatorless.dart';

class PesquisaPage extends StatefulWidget {
  const PesquisaPage({super.key});

  @override
  State<PesquisaPage> createState() => _PesquisaPageState();
}

class _PesquisaPageState extends State<PesquisaPage> {
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  final FocusNode _focusNode = FocusNode();
  List<InfosLocal> _resultados = [];
  final SecturPiraService _secturPiraService = SecturPiraService();
  final TextEditingController _pesquisaController = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  bool _hasSearched = false;
  String initialStringValue =
      "Procurando por algo específico? Digite o nome de um local para começar sua pesquisa.";

  void _clearFields() {
    _pesquisaController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Encontre Seu Destino",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SizedBox(
                    // color: Colors.green,
                    height: 80,
                    // width: 350,
                    child: Form(
                      key: _formKey,
                      child: SizedBox(
                        child: TextFormField(
                          validator: Validatorless.required('Insira um nome'),
                          controller: _pesquisaController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(45),
                              ),
                              borderSide: BorderSide(
                                  color: Colors.black), // Cor da borda ao focar
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(45),
                              ),
                            ),
                            errorBorder: const OutlineInputBorder(
                              gapPadding: 20,
                              borderRadius: BorderRadius.all(
                                Radius.circular(45),
                              ),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            contentPadding: const EdgeInsets.all(15),
                            hintText: "Insira um nome",
                            hintStyle: GoogleFonts.lato(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic),
                            helperText:
                                ' ', // Reserva espaço para a mensagem de erro
                            errorStyle: const TextStyle(
                                height:
                                    1.5), // Define a altura da mensagem de erro
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 3.0),
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  elevation: 2,
                                ),
                                onPressed: () async {
                                  final isValid =
                                      _formKey.currentState!.validate();

                                  if (isValid) {
                                    setState(() {
                                      _isLoading = true;
                                      _hasSearched = false;
                                    });
                                    await Future.delayed(
                                        const Duration(seconds: 1));

                                    List<InfosLocal> resultados =
                                        await _secturPiraService
                                            .pesquisaUsuario(
                                                _pesquisaController.text);
                                    setState(() {
                                      _resultados = resultados;
                                      _isLoading = false;
                                      _hasSearched = true;
                                    });
                                    _clearFields();
                                  }
                                },
                                child: Text(
                                  'Pesquisar',
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(255, 64, 124, 150),
                                        fontWeight: FontWeight.w800),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          style: const TextStyle(
                              color: Colors.black), // Define a cor do texto
                          onChanged: (value) {
                            _formKey.currentState!
                                .validate(); // Valida o campo a cada mudança
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                if (_isLoading)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Buscando",
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 64, 124, 150),
                                fontWeight: FontWeight.w500),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .3,
                          child: const LinearProgressIndicator(
                            color: Color.fromARGB(255, 64, 124, 150),
                            minHeight: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                if (_hasSearched && _resultados.isEmpty) // Add this block
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 250,
                      child: Text(
                        "Sua pesquisa não retornou nenhum resultado. Por favor, tente novamente com um termo diferente",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                              fontWeight: FontWeight.w500),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                if (_resultados.isEmpty &&
                    _hasSearched == false &&
                    _isLoading == false)
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .7,
                      child: Text(
                        initialStringValue,
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 64, 124, 150),
                              fontWeight: FontWeight.w800),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                Column(
                  children: [
                    if (_resultados.isNotEmpty)
                      Column(
                        children: [
                          Text(
                            'Resultado da sua pesquisa',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 64, 124, 150),
                                  fontWeight: FontWeight.w500),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          if (_resultados.isNotEmpty)
                            _resultados.length <= 1
                                ? Text(
                                    '${_resultados.length} resultado encontrado',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromARGB(255, 64, 124, 150),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                : Text(
                                    '${_resultados.length} resultados encontrados',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromARGB(255, 64, 124, 150),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                        ],
                      ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: _resultados.length,
                        itemBuilder: (context, index) {
                          InfosLocal infosLocal = _resultados[index];
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Details(details: infosLocal.toMap()),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.search,
                                        color: Colors.grey),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 0.3,
                                      height: 30,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage(
                                          "http://177.52.106.73/assets/uploads/${infosLocal.localfoto1}"),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    '${infosLocal.localnome}\n',
                                                style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    '${infosLocal.localcidade}, ${infosLocal.localestado}',
                                                style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white),
                          onPressed: () {
                            setState(
                              () {
                                // Limpa os resultados para esconder o card
                              },
                            );
                          },
                          child: const Text('Fechar'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: _resultados.isNotEmpty
            ? FloatingActionButton.small(
                backgroundColor: Colors.white,
                child: const Icon(
                  Ionicons.trash_bin,
                  color: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    _resultados.clear();
                    _hasSearched = false;
                  });
                },
              )
            : null,
      ),
    );
  }
}
