import 'dart:convert';

class InfosLocal {
  final int localid;
  final int usuarioid;
  final int categoriaid;
  final int naturezaid;
  final String localstatus;
  final String localnome;
  final String localdescricao;
  final String localenderecodescricao;
  final String localrua;
  final String localnumero;
  final String localbairro;
  final String localcidade;
  final String localestado;
  final String localcep;
  final String localcomplemento;
  final String localtelefone;
  final String locallatitude;
  final String locallongitude;
  final String localposicaogoogle;
  final String localfoto1;
  final String localfoto2;
  final String localfoto3;
  final String localfoto4;
  final String localfoto5;
  final String localwebsite;
  final String localemail;
  final String localcelular;
  final String localcelularwhatsapp;
  final String localfacebook;
  final String localinstagram;
  final String placeid;

  InfosLocal({
    required this.localid,
    required this.usuarioid,
    required this.categoriaid,
    required this.naturezaid,
    required this.localstatus,
    required this.localnome,
    required this.localdescricao,
    required this.localenderecodescricao,
    required this.localrua,
    required this.localnumero,
    required this.localbairro,
    required this.localcidade,
    required this.localestado,
    required this.localcep,
    required this.localcomplemento,
    required this.localtelefone,
    required this.locallatitude,
    required this.locallongitude,
    required this.localposicaogoogle,
    required this.localfoto1,
    required this.localfoto2,
    required this.localfoto3,
    required this.localfoto4,
    required this.localfoto5,
    required this.localwebsite,
    required this.localemail,
    required this.localcelular,
    required this.localcelularwhatsapp,
    required this.localfacebook,
    required this.localinstagram,
    required this.placeid,
  });

  factory InfosLocal.fromMap(Map<String, dynamic> map) {
    return InfosLocal(
      localid: map['localid'],
      usuarioid: map['usuarioid'],
      categoriaid: map['categoriaid'],
      naturezaid: map['naturezaid'],
      localstatus: map['localstatus'],
      localnome: map['localnome'],
      localdescricao: map['localdescricao'],
      localenderecodescricao: map['localenderecodescricao'],
      localrua: map['localrua'],
      localnumero: map['localnumero'],
      localbairro: map['localbairro'],
      localcidade: map['localcidade'],
      localestado: map['localestado'],
      localcep: map['localcep'],
      localcomplemento: map['localcomplemento'],
      localtelefone: map['localtelefone'],
      locallatitude: map['locallatitude'],
      locallongitude: map['locallongitude'],
      localposicaogoogle: map['localposicaogoogle'],
      localfoto1: map['localfoto1'],
      localfoto2: map['localfoto2'],
      localfoto3: map['localfoto3'],
      localfoto4: map['localfoto4'],
      localfoto5: map['localfoto5'],
      localwebsite: map['localwebsite'],
      localemail: map['localemail'],
      localcelular: map['localcelular'],
      localcelularwhatsapp: map['localcelularwhatsapp'],
      localfacebook: map['localfacebook'],
      localinstagram: map['localinstagram'],
      placeid: map['placeid'],
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic> {
      'localid': localid,
      'usuarioid': usuarioid,
      'categoriaid': categoriaid,
      'naturezaid': naturezaid,
      'localstatus': localstatus,
      'localnome': localnome,
      'localdescricao': localdescricao,
      'localenderecodescricao': localenderecodescricao,
      'localrua': localrua,
      'localnumero': localnumero,
      'localbairro': localbairro,
      'localcidade': localcidade,
      'localestado': localestado,
      'localcep': localcep,
      'localcomplemento': localcomplemento,
      'localtelefone': localtelefone,
      'locallatitude': locallatitude,
      'locallongitude': locallongitude,
      'localposicaogoogle': localposicaogoogle,
      'localfoto1': localfoto1,
      'localfoto2': localfoto2,
      'localfoto3': localfoto3,
      'localfoto4': localfoto4,
      'localfoto5': localfoto5,
      'localwebsite': localwebsite,
      'localemail': localemail,
      'localcelular': localcelular,
      'localcelularwhatsapp': localcelularwhatsapp,
      'localfacebook': localfacebook,
      'localinstagram': localinstagram,
      'placeid': placeid,
    };
    return map;
  }

  String toJson() => jsonEncode(toMap());

  factory InfosLocal.fromJson(String json) => InfosLocal.fromMap(jsonDecode(json));


   @override
  String toString() {
    return 'InfosLocal(localid: $localid, usuarioid: $usuarioid, categoriaid: $categoriaid, naturezaid: $naturezaid, '
           'localstatus: $localstatus, localnome: $localnome, localdescricao: $localdescricao, '
           'localenderecodescricao: $localenderecodescricao, localrua: $localrua, localnumero: $localnumero, '
           'localbairro: $localbairro, localcidade: $localcidade, localestado: $localestado, localcep: $localcep, '
           'localcomplemento: $localcomplemento, localtelefone: $localtelefone, locallatitude: $locallatitude, '
           'locallongitude: $locallongitude, localposicaogoogle: $localposicaogoogle, localfoto1: $localfoto1, '
           'localfoto2: $localfoto2, localfoto3: $localfoto3, localfoto4: $localfoto4, localfoto5: $localfoto5, '
           'localwebsite: $localwebsite, localemail: $localemail, localcelular: $localcelular, '
           'localcelularwhatsapp: $localcelularwhatsapp, localfacebook: $localfacebook, localinstagram: $localinstagram, '
           'placeid: $placeid)';
  }
}