import 'package:flutter_challange_motel_list/models/motel_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ApiMotelModel deve converter JSON corretamente', () {
    final json = {
      "sucesso": true,
      "data": {
        "pagina": 1,
        "qtdPorPagina": 10,
        "totalSuites": 5,
        "totalMoteis": 2,
        "raio": 10.0,
        "maxPaginas": 2,
        "moteis": []
      }
    };

    final model = ApiMotelModel.fromJson(json);

    expect(model.sucesso, true);
    expect(model.pagina, 1);
    expect(model.qtdPorPagina, 10);
  });
}
