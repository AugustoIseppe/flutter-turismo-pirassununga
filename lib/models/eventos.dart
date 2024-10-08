class ModeloEventos {
  ModeloEventos({
    required this.rua,
    required this.bairro,
    required this.numero,
    required this.local,
    required this.id,
    required this.nome,
    required this.telefone,
    required this.descricao,
    required this.imagem,
    required this.data,
    required this.horario,
    required this.organizador,
    required this.categoria,
    required this.latitude,
    required this.longitude,
    required this.faixaEtaria, 
  });

  final int id;
  final String nome;
  final String descricao;
  final String imagem;
  final String data;
  final String telefone;
  final String horario;
  final String rua;
  final String bairro;
  final String numero;
  final String local;
  final String organizador;
  final String categoria;
  final String latitude;
  final String longitude;
  final int faixaEtaria;
}
