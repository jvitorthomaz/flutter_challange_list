import 'dart:convert';

class ApiMotelModel {
  final bool sucesso;
  final int pagina;
  final int qtdPorPagina;
  final int totalSuites;
  final int totalMoteis;
  final double raio;
  final double maxPaginas;
  final List<MotelModel> moteis;

  ApiMotelModel({
    required this.sucesso,
    required this.pagina,
    required this.qtdPorPagina,
    required this.totalSuites,
    required this.totalMoteis,
    required this.raio,
    required this.maxPaginas,
    required this.moteis,
  });

  factory ApiMotelModel.fromJson(Map<String, dynamic> json) =>
      ApiMotelModel.fromMap(json);

  factory ApiMotelModel.fromMap(Map<String, dynamic> json) {
    return ApiMotelModel(
      sucesso: json["sucesso"] ?? false,
      pagina: json["data"]["pagina"] ?? 0,
      qtdPorPagina: json["data"]["qtdPorPagina"] ?? 0,
      totalSuites: json["data"]["totalSuites"] ?? 0,
      totalMoteis: json["data"]["totalMoteis"] ?? 0,
      raio: (json["data"]["raio"] as num?)?.toDouble() ?? 0.0,
      maxPaginas: (json["data"]["maxPaginas"] as num?)?.toDouble() ?? 0.0,
      moteis: (json["data"]["moteis"] as List<dynamic>?)
              ?.map((x) => MotelModel.fromMap(x))
              .toList() ??
          [],
    );
  }
}

class MotelModel {
  final String fantasia;
  final String bairro;
  final String logo;
  final double distancia;
  final int qtdFavoritos;
  final List<Suite> suites;

  MotelModel({
    required this.fantasia,
    required this.bairro,
    required this.logo,
    required this.distancia,
    required this.qtdFavoritos,
    required this.suites,
  });

  factory MotelModel.fromMap(Map<String, dynamic> json) => MotelModel(
        fantasia: json["fantasia"] ?? '',
        bairro: json["bairro"] ?? '',
        logo: json["logo"] ?? '',
        distancia: (json["distancia"] as num?)?.toDouble() ?? 0.0,
        qtdFavoritos: json["qtdFavoritos"] ?? 0,
        suites: (json["suites"] as List<dynamic>?)
                ?.map((x) => Suite.fromMap(x))
                .toList() ??
            [],
      );
}

class Suite {
  final String nome;
  final String imagem;
  final int qtd;
  final List<Item> itens;
  final List<Periodo> periodos;

  Suite({
    required this.nome,
    required this.imagem,
    required this.qtd,
    required this.itens,
    required this.periodos,
  });

  factory Suite.fromMap(Map<String, dynamic> json) => Suite(
        nome: json["nome"] ?? '',
        imagem: json["imagem"] ?? '',
        qtd: json["qtd"] ?? 0,
        itens: (json["itens"] as List<dynamic>?)
                ?.map((x) => Item.fromMap(x))
                .toList() ??
            [],
        periodos: (json["periodos"] as List<dynamic>?)
                ?.map((x) => Periodo.fromMap(x))
                .toList() ??
            [],
      );
}

class Item {
  final String nome;

  Item({required this.nome});

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        nome: json["nome"] ?? '',
      );
}

class Periodo {
  final String tempo;
  final double valor;

  Periodo({
    required this.tempo,
    required this.valor,
  });

  factory Periodo.fromMap(Map<String, dynamic> json) => Periodo(
        tempo: json["tempo"] ?? '',
        valor: (json["valor"] as num?)?.toDouble() ?? 0.0,
      );
}
