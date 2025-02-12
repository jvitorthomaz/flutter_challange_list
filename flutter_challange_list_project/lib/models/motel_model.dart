import 'dart:convert';

class MotelModel {
  final bool sucesso;
  final int pagina;
  final int qtdPorPagina;
  final int totalSuites;
  final int totalMoteis;
  final double raio;
  final double maxPaginas;
  final List<dynamic> moteis;

  MotelModel({
    required this.sucesso,
    required this.pagina,
    required this.qtdPorPagina,
    required this.totalSuites,
    required this.totalMoteis,
    required this.raio,
    required this.maxPaginas,
    required this.moteis,
  });

  factory MotelModel.fromJson(String str) =>
      MotelModel.fromMap(json.decode(str));

  factory MotelModel.fromMap(Map<String, dynamic> json) => MotelModel(
        sucesso: json["sucesso"],
        pagina: json["data"]["pagina"],
        qtdPorPagina: json["data"]["qtdPorPagina"],
        totalSuites: json["data"]["totalSuites"],
        totalMoteis: json["data"]["totalMoteis"],
        raio: (json["data"]["raio"] as num).toDouble(),
        maxPaginas: (json["data"]["maxPaginas"] as num).toDouble(),
        moteis: json["data"]["moteis"],
      );
}

// class MotelModel {
//   final bool sucesso;
//   final int pagina;
//   final int qtdPorPagina;
//   final int totalSuites;
//   final int totalMoteis;
//   final double raio;
//   final double maxPaginas;
//   final List<Motel> moteis;

//   MotelModel({
//     required this.sucesso,
//     required this.pagina,
//     required this.qtdPorPagina,
//     required this.totalSuites,
//     required this.totalMoteis,
//     required this.raio,
//     required this.maxPaginas,
//     required this.moteis,
//   });

//   factory MotelModel.fromJson(String str) =>
//       MotelModel.fromMap(json.decode(str));

//   factory MotelModel.fromMap(Map<String, dynamic> json) => MotelModel(
//         sucesso: json["sucesso"],
//         pagina: json["data"]["pagina"],
//         qtdPorPagina: json["data"]["qtdPorPagina"],
//         totalSuites: json["data"]["totalSuites"],
//         totalMoteis: json["data"]["totalMoteis"],
//         raio: json["data"]["raio"].toDouble(),
//         maxPaginas: json["data"]["maxPaginas"].toDouble(),
//         moteis: List<Motel>.from(
//             json["data"]["moteis"].map((x) => Motel.fromMap(x))),
//       );
// }

// class Motel {
//   final String fantasia;
//   final String logo;
//   final String bairro;
//   final double distancia;
//   final int qtdFavoritos;
//   final List<Suite> suites;
//   final int qtdAvaliacoes;
//   final double media;

//   Motel({
//     required this.fantasia,
//     required this.logo,
//     required this.bairro,
//     required this.distancia,
//     required this.qtdFavoritos,
//     required this.suites,
//     required this.qtdAvaliacoes,
//     required this.media,
//   });

//   factory Motel.fromMap(Map<String, dynamic> json) => Motel(
//         fantasia: json["fantasia"],
//         logo: json["logo"],
//         bairro: json["bairro"],
//         distancia: json["distancia"].toDouble(),
//         qtdFavoritos: json["qtdFavoritos"],
//         suites: List<Suite>.from(json["suites"].map((x) => Suite.fromMap(x))),
//         qtdAvaliacoes: json["qtdAvaliacoes"],
//         media: json["media"].toDouble(),
//       );
// }

// class Suite {
//   final String nome;
//   final int qtd;
//   final bool exibirQtdDisponiveis;
//   final List<String> fotos;
//   final List<String> itens;
//   final List<CategoriaItem> categoriaItens;
//   final List<Periodo> periodos;

//   Suite({
//     required this.nome,
//     required this.qtd,
//     required this.exibirQtdDisponiveis,
//     required this.fotos,
//     required this.itens,
//     required this.categoriaItens,
//     required this.periodos,
//   });

//   factory Suite.fromMap(Map<String, dynamic> json) => Suite(
//         nome: json["nome"],
//         qtd: json["qtd"],
//         exibirQtdDisponiveis: json["exibirQtdDisponiveis"],
//         fotos: List<String>.from(json["fotos"].map((x) => x)),
//         itens: List<String>.from(json["itens"].map((x) => x["nome"])),
//         categoriaItens: List<CategoriaItem>.from(
//             json["categoriaItens"].map((x) => CategoriaItem.fromMap(x))),
//         periodos:
//             List<Periodo>.from(json["periodos"].map((x) => Periodo.fromMap(x))),
//       );
// }

// class CategoriaItem {
//   final String nome;
//   final String icone;

//   CategoriaItem({required this.nome, required this.icone});

//   factory CategoriaItem.fromMap(Map<String, dynamic> json) => CategoriaItem(
//         nome: json["nome"],
//         icone: json["icone"],
//       );
// }

// class Periodo {
//   final String tempoFormatado;
//   final String tempo;
//   final double valor;
//   final double valorTotal;
//   final bool temCortesia;
//   final double? desconto;

//   Periodo({
//     required this.tempoFormatado,
//     required this.tempo,
//     required this.valor,
//     required this.valorTotal,
//     required this.temCortesia,
//     this.desconto,
//   });

//   factory Periodo.fromMap(Map<String, dynamic> json) => Periodo(
//         tempoFormatado: json["tempoFormatado"],
//         tempo: json["tempo"],
//         valor: json["valor"].toDouble(),
//         valorTotal: json["valorTotal"].toDouble(),
//         temCortesia: json["temCortesia"],
//         desconto: json["desconto"]?["desconto"]?.toDouble(),
//       );
// }

