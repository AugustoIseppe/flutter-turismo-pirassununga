import 'package:projeto_turismo_pirassununga/data/database.dart';
import 'package:projeto_turismo_pirassununga/models/infos_local.dart';

class SecturPiraService {
  final Database _database = Database();

  ///* 1-> LISTAR HOSPEDAGEM  *///
  Future<List<InfosLocal>> listarHospedagem() async {
    await _database.openConnection();
    var results = await _database.connection
        .query('SELECT * FROM infoslocal WHERE categoriaid=1;');

    List<InfosLocal> hospedagem = [];

    for (var row in results) {
      var map = {
        'localid': row[0] ?? 0,
        'usuarioid': row[1] ?? 0,
        'categoriaid': row[2] ?? 0,
        'naturezaid': row[3] ?? 0,
        'localstatus': row[4] ?? 'Local não encontrado',
        'localnome': row[5] ?? 'Local não encontrado',
        'localdescricao': row[6] ?? 'Local não encontrado',
        'localenderecodescricao': row[7] ?? 'Local não encontrado',
        'localrua': row[8] ?? 'Local não encontrado',
        'localnumero': row[9] ?? 'Local não encontrado',
        'localbairro': row[10] ?? 'Local não encontrado',
        'localcidade': row[11] ?? 'Local não encontrado',
        'localestado': row[12] ?? 'Local não encontrado',
        'localcep': row[13] ?? 'Local não encontrado',
        'localcomplemento': row[14] ?? 'Local não encontrado',
        'localtelefone': row[15] ?? 'Local não encontrado',
        'locallatitude': row[16] ?? 'Local não encontrado',
        'locallongitude': row[17] ?? 'Local não encontrado',
        'localposicaogoogle': row[18] ?? 'Local não encontrado',
        'localfoto1': row[19] ?? 'Local não encontrado',
        'localfoto2': row[20] ?? 'Local não encontrado',
        'localfoto3': row[21] ?? 'Local não encontrado',
        'localfoto4': row[22] ?? 'Local não encontrado',
        'localfoto5': row[23] ?? 'Local não encontrado',
        'localwebsite': row[24] ?? 'Local não encontrado',
        'localemail': row[25] ?? 'Local não encontrado',
        'localcelular': row[26] ?? 'Local não encontrado',
        'localcelularwhatsapp': row[27] ?? 'Local não encontrado',
        'localfacebook': row[28] ?? 'Local não encontrado',
        'localinstagram': row[29] ?? 'Local não encontrado',
        'placeid': row[30] ?? 'Local não encontrado',
      };
      hospedagem.add(InfosLocal.fromMap(map));
      for (var element in hospedagem) {
        print('LISTA DE HOSPEDAGEM -> ${element.localnome}');
      }
      // print('LISTA DE HOSPEDAGENS -> $hospedagem');
    }
    await _database.closeConnection();
    return hospedagem;
  }

  ///* 2 -> LISTAR BARES *///
  Future<List<InfosLocal>> listarBares() async {
    await _database.openConnection();
    var results = await _database.connection
        .query('SELECT * from infoslocal WHERE categoriaid=6');

    List<InfosLocal> bares = [];

    for (var row in results) {
      var map = {
        'localid': row[0],
        'usuarioid': row[1],
        'categoriaid': row[2],
        'naturezaid': row[3] ?? 0,
        'localstatus': row[4],
        'localnome': row[5],
        'localdescricao': row[6],
        'localenderecodescricao': row[7],
        'localrua': row[8],
        'localnumero': row[9],
        'localbairro': row[10],
        'localcidade': row[11],
        'localestado': row[12],
        'localcep': row[13],
        'localcomplemento': row[14],
        'localtelefone': row[15],
        'locallatitude': row[16],
        'locallongitude': row[17],
        'localposicaogoogle': row[18],
        'localfoto1': row[19],
        'localfoto2': row[20],
        'localfoto3': row[21],
        'localfoto4': row[22],
        'localfoto5': row[23],
        'localwebsite': row[24],
        'localemail': row[25],
        'localcelular': row[26],
        'localcelularwhatsapp': row[27],
        'localfacebook': row[28],
        'localinstagram': row[29],
        'placeid': row[30],
      };
      bares.add(InfosLocal.fromMap(map));
    }
    await _database.closeConnection();
    return bares;
  }

  ///* 3 -> LISTAR RESTAURANTES  *///
  Future<List<InfosLocal>> listarRestaurantes() async {
    await _database.openConnection();
    var results = await _database.connection
        .query('SELECT * from infoslocal WHERE categoriaid=7');

    List<InfosLocal> restaurantes = [];

    for (var row in results) {
      var map = {
        'localid': row[0],
        'usuarioid': row[1],
        'categoriaid': row[2],
        'naturezaid': row[3] ?? 0,
        'localstatus': row[4],
        'localnome': row[5],
        'localdescricao': row[6],
        'localenderecodescricao': row[7],
        'localrua': row[8],
        'localnumero': row[9],
        'localbairro': row[10],
        'localcidade': row[11],
        'localestado': row[12],
        'localcep': row[13],
        'localcomplemento': row[14],
        'localtelefone': row[15],
        'locallatitude': row[16],
        'locallongitude': row[17],
        'localposicaogoogle': row[18],
        'localfoto1': row[19],
        'localfoto2': row[20],
        'localfoto3': row[21],
        'localfoto4': row[22],
        'localfoto5': row[23],
        'localwebsite': row[24],
        'localemail': row[25],
        'localcelular': row[26],
        'localcelularwhatsapp': row[27],
        'localfacebook': row[28],
        'localinstagram': row[29],
        'placeid': row[30],
      };
      restaurantes.add(InfosLocal.fromMap(map));
    }
    await _database.closeConnection();
    return restaurantes;
  }

  ///* 4 -> LISTAR LANCHONETE  *///
  Future<List<InfosLocal>> listarLanchonete() async {
    await _database.openConnection();
    var results = await _database.connection
        .query('SELECT * from infoslocal WHERE categoriaid=7');

    List<InfosLocal> lanchonete = [];

    for (var row in results) {
      var map = {
        'localid': row[0],
        'usuarioid': row[1],
        'categoriaid': row[2],
        'naturezaid': row[3] ?? 0,
        'localstatus': row[4],
        'localnome': row[5],
        'localdescricao': row[6],
        'localenderecodescricao': row[7],
        'localrua': row[8],
        'localnumero': row[9],
        'localbairro': row[10],
        'localcidade': row[11],
        'localestado': row[12],
        'localcep': row[13],
        'localcomplemento': row[14],
        'localtelefone': row[15],
        'locallatitude': row[16],
        'locallongitude': row[17],
        'localposicaogoogle': row[18],
        'localfoto1': row[19],
        'localfoto2': row[20],
        'localfoto3': row[21],
        'localfoto4': row[22],
        'localfoto5': row[23],
        'localwebsite': row[24],
        'localemail': row[25],
        'localcelular': row[26],
        'localcelularwhatsapp': row[27],
        'localfacebook': row[28],
        'localinstagram': row[29],
        'placeid': row[30],
      };
      lanchonete.add(InfosLocal.fromMap(map));
    }
    await _database.closeConnection();
    return lanchonete;
  }

  ///* 4 -> LISTAR PIZZARIAS  *///
  Future<List<InfosLocal>> listarPizzaria() async {
    await _database.openConnection();
    var results = await _database.connection
        .query('SELECT * from infoslocal WHERE categoriaid=7');

    List<InfosLocal> pizzaria = [];

    for (var row in results) {
      var map = {
        'localid': row[0],
        'usuarioid': row[1],
        'categoriaid': row[2],
        'naturezaid': row[3] ?? 0,
        'localstatus': row[4],
        'localnome': row[5],
        'localdescricao': row[6],
        'localenderecodescricao': row[7],
        'localrua': row[8],
        'localnumero': row[9],
        'localbairro': row[10],
        'localcidade': row[11],
        'localestado': row[12],
        'localcep': row[13],
        'localcomplemento': row[14],
        'localtelefone': row[15],
        'locallatitude': row[16],
        'locallongitude': row[17],
        'localposicaogoogle': row[18],
        'localfoto1': row[19],
        'localfoto2': row[20],
        'localfoto3': row[21],
        'localfoto4': row[22],
        'localfoto5': row[23],
        'localwebsite': row[24],
        'localemail': row[25],
        'localcelular': row[26],
        'localcelularwhatsapp': row[27],
        'localfacebook': row[28],
        'localinstagram': row[29],
        'placeid': row[30],
      };
      pizzaria.add(InfosLocal.fromMap(map));
    }
    await _database.closeConnection();
    return pizzaria;
  }

  /* LISTAR CATEGORIAS */
  Future<List<Map<String, dynamic>>> listarCategoria() async {
    await _database.openConnection();
    var results = await _database.connection
        .query('SELECT categoriaid, categorianome from categoria');

    List<Map<String, dynamic>> categorias = [];

    for (var row in results) {
      categorias.add({
        'categoriaid': row[0],
        'categorianome': row[1],
      });
    }

    await _database.closeConnection();
    return categorias;
  }

  /* LISTAR PRINCIPAIS DESTINOS */
  Future<List<Map<String, dynamic>>> listarPrincipaisDestinos() async {
    await _database.openConnection();
    var results = await _database.connection.query('SELECT * from infoslocal');

    List<Map<String, dynamic>> principaisDestinos = [];

    for (var row in results) {
      principaisDestinos.add({
        'localid': row[0],
        'usuarioid': row[1],
        'categoriaid': row[2],
        'naturezaid': row[3],
        'localstatus': row[4],
        'localnome': row[5],
        'localdescricao': row[6],
        'localenderecodescricao': row[7],
        'localrua': row[8],
        'localnumero': row[9],
        'localbairro': row[10],
        'localcidade': row[11],
        'localestado': row[12],
        'localcep': row[13],
        'localcomplemento': row[14],
        'localtelefone': row[15],
        'locallatitude': row[16],
        'locallongitude': row[17],
        'localposicaogoogle': row[18],
        'localfoto1': row[19],
        'localfoto2': row[20],
        'localfoto3': row[21],
        'localfoto4': row[22],
        'localfoto5': row[23],
        'localwebsite': row[24],
        'localemail': row[25],
        'localcelular': row[26],
        'localcelularwhatsapp': row[27],
        'localfacebook': row[28],
        'localinstagram': row[29],
        'placeid': row[30],
      });
    }
    await _database.closeConnection();
    return principaisDestinos;
  }

  /* LISTAR MELHORES AVALIADOS */
  Future<List<Map<String, dynamic>>> listarMelhoresAvaliados() async {
    await _database.openConnection();
    var results = await _database.connection.query(
        'SELECT * from infoslocal WHERE categoriaid=5 OR categoriaid=6 OR categoriaid=1 OR categoriaid=7 ORDER BY infoslocal.localnome ASC');

    List<Map<String, dynamic>> melhoresAvaliados = [];

    for (var row in results) {
      melhoresAvaliados.add({
        'localid': row[0],
        'usuarioid': row[1],
        'categoriaid': row[2],
        'naturezaid': row[3],
        'localstatus': row[4],
        'localnome': row[5],
        'localdescricao': row[6],
        'localenderecodescricao': row[7],
        'localrua': row[8],
        'localnumero': row[9],
        'localbairro': row[10],
        'localcidade': row[11],
        'localestado': row[12],
        'localcep': row[13],
        'localcomplemento': row[14],
        'localtelefone': row[15],
        'locallatitude': row[16],
        'locallongitude': row[17],
        'localposicaogoogle': row[18],
        'localfoto1': row[19],
        'localfoto2': row[20],
        'localfoto3': row[21],
        'localfoto4': row[22],
        'localfoto5': row[23],
        'localwebsite': row[24],
        'localemail': row[25],
        'localcelular': row[26],
        'localcelularwhatsapp': row[27],
        'localfacebook': row[28],
        'localinstagram': row[29],
        'placeid': row[30],
      });
    }
    await _database.closeConnection();
    return melhoresAvaliados;
  }

  /* LISTAR LOCAIS POR CATEGORIA */
  Future<List<Map<String, dynamic>>> listarLocalPorCategoria(
      String categoriaId) async {
    await _database.openConnection();
    var results = await _database.connection
        .query("SELECT * FROM infoslocal WHERE categoriaid = $categoriaId");

    List<Map<String, dynamic>> localPorCategoria = [];

    for (var row in results) {
      localPorCategoria.add({
        'localid': row[0],
        'usuarioid': row[1],
        'categoriaid': row[2],
        'naturezaid': row[3],
        'localstatus': row[4],
        'localnome': row[5],
        'localdescricao': row[6],
        'localenderecodescricao': row[7],
        'localrua': row[8],
        'localnumero': row[9],
        'localbairro': row[10],
        'localcidade': row[11],
        'localestado': row[12],
        'localcep': row[13],
        'localcomplemento': row[14],
        'localtelefone': row[15],
        'locallatitude': row[16],
        'locallongitude': row[17],
        'localposicaogoogle': row[18],
        'localfoto1': row[19],
        'localfoto2': row[20],
        'localfoto3': row[21],
        'localfoto4': row[22],
        'localfoto5': row[23],
        'localwebsite': row[24],
        'localemail': row[25],
        'localcelular': row[26],
        'localcelularwhatsapp': row[27],
        'localfacebook': row[28],
        'localinstagram': row[29],
        'placeid': row[30],
      });
    }
    await _database.closeConnection();
    return localPorCategoria;
  }

  /* QUERY DE PESQUISA */
  Future<List<InfosLocal>> pesquisaUsuario(String userSearch) async {
    List<InfosLocal> userResult = [];
    Set<int> addedLocalIds =
        Set(); // Set para rastrear os IDs dos locais adicionados

    try {
      await _database.openConnection();

      // Primeira consulta: Busca por nome do local
      var resultsByLocalName = await _database.connection.query(
          'SELECT * FROM infoslocal WHERE LOWER(localnome) LIKE LOWER(?)',
          ['%$userSearch%']);

      for (var row in resultsByLocalName) {
        int localId =
            row[0]; // Supondo que o ID do local está na primeira coluna
        if (!addedLocalIds.contains(localId)) {
          addedLocalIds.add(localId); // Adiciona o ID ao conjunto
          var map = {
            'localid': row[0],
            'usuarioid': row[1],
            'categoriaid': row[2],
            'naturezaid': row[3] ?? 0,
            'localstatus': row[4],
            'localnome': row[5],
            'localdescricao': row[6],
            'localenderecodescricao': row[7],
            'localrua': row[8],
            'localnumero': row[9],
            'localbairro': row[10],
            'localcidade': row[11],
            'localestado': row[12],
            'localcep': row[13],
            'localcomplemento': row[14],
            'localtelefone': row[15],
            'locallatitude': row[16],
            'locallongitude': row[17],
            'localposicaogoogle': row[18],
            'localfoto1': row[19],
            'localfoto2': row[20],
            'localfoto3': row[21],
            'localfoto4': row[22],
            'localfoto5': row[23],
            'localwebsite': row[24],
            'localemail': row[25],
            'localcelular': row[26],
            'localcelularwhatsapp': row[27],
            'localfacebook': row[28],
            'localinstagram': row[29],
            'placeid': row[30],
          };
          userResult.add(InfosLocal.fromMap(map));
        }
      }

      // Segunda consulta: Busca por nome da categoria
      var resultsByCategory = await _database.connection.query('''
      SELECT infoslocal.* 
      FROM infoslocal 
      INNER JOIN categoria ON infoslocal.categoriaid = categoria.categoriaid 
      WHERE LOWER(categoria.categorianome) LIKE LOWER(?)
      ''', ['%$userSearch%']);

      for (var row in resultsByCategory) {
        int localId =
            row[0]; // Supondo que o ID do local está na primeira coluna
        if (!addedLocalIds.contains(localId)) {
          addedLocalIds.add(localId); // Adiciona o ID ao conjunto
          var map = {
            'localid': row[0],
            'usuarioid': row[1],
            'categoriaid': row[2],
            'naturezaid': row[3] ?? 0,
            'localstatus': row[4],
            'localnome': row[5],
            'localdescricao': row[6],
            'localenderecodescricao': row[7],
            'localrua': row[8],
            'localnumero': row[9],
            'localbairro': row[10],
            'localcidade': row[11],
            'localestado': row[12],
            'localcep': row[13],
            'localcomplemento': row[14],
            'localtelefone': row[15],
            'locallatitude': row[16],
            'locallongitude': row[17],
            'localposicaogoogle': row[18],
            'localfoto1': row[19],
            'localfoto2': row[20],
            'localfoto3': row[21],
            'localfoto4': row[22],
            'localfoto5': row[23],
            'localwebsite': row[24],
            'localemail': row[25],
            'localcelular': row[26],
            'localcelularwhatsapp': row[27],
            'localfacebook': row[28],
            'localinstagram': row[29],
            'placeid': row[30],
          };
          userResult.add(InfosLocal.fromMap(map));
        }
      }
    } catch (e) {
      print('Erro ao executar a consulta: $e');
    } finally {
      try {
        await _database.closeConnection();
      } catch (e) {
        print('Erro ao fechar a conexão: $e');
      }
    }

    return userResult;
  }

  // Future<List<InfosLocal>> pesquisaUsuario(String userSearch) async {
  //     List<InfosLocal> userResult = [];
  //   try {
  //     await _database.openConnection();

  //     var results = await _database.connection.query(
  //         'SELECT * FROM infoslocal WHERE LOWER(localnome) LIKE LOWER(?)',
  //         ['%$userSearch%']);

  //     for (var row in results) {
  //       var map = {
  //         'localid': row[0],
  //         'usuarioid': row[1],
  //         'categoriaid': row[2],
  //         'naturezaid': row[3] ?? 0,
  //         'localstatus': row[4],
  //         'localnome': row[5],
  //         'localdescricao': row[6],
  //         'localenderecodescricao': row[7],
  //         'localrua': row[8],
  //         'localnumero': row[9],
  //         'localbairro': row[10],
  //         'localcidade': row[11],
  //         'localestado': row[12],
  //         'localcep': row[13],
  //         'localcomplemento': row[14],
  //         'localtelefone': row[15],
  //         'locallatitude': row[16],
  //         'locallongitude': row[17],
  //         'localposicaogoogle': row[18],
  //         'localfoto1': row[19],
  //         'localfoto2': row[20],
  //         'localfoto3': row[21],
  //         'localfoto4': row[22],
  //         'localfoto5': row[23],
  //         'localwebsite': row[24],
  //         'localemail': row[25],
  //         'localcelular': row[26],
  //         'localcelularwhatsapp': row[27],
  //         'localfacebook': row[28],
  //         'localinstagram': row[29],
  //         'placeid': row[30],
  //       };
  //       userResult.add(InfosLocal.fromMap(map));
  //     }
  //   } catch (e) {
  //     print('Erro ao executar a consulta: $e');
  //   } finally {
  //     try {
  //       // await _database.closeConnection();
  //     } catch (e) {
  //       print('Erro ao fechar a conexão: $e');
  //     }
  //   }

  //   return userResult;
  // }
}
