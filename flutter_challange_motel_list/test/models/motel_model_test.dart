import 'package:flutter_challange_motel_list/models/motel_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MotelModel', () {
    test('should parse JSON correctly', () {
      final jsonData = {
        "sucesso": true,
        "data": {
          "pagina": 1,
          "qtdPorPagina": 10,
          "totalSuites": 50,
          "totalMoteis": 5,
          "raio": 5.0,
          "maxPaginas": 5.0,
          "moteis": [
            {"fantasia": "Motel 1", "bairro": "Bairro 1", "logo": "http://example.com/logo1.png"},
            {"fantasia": "Motel 2", "bairro": "Bairro 2", "logo": "http://example.com/logo2.png"},
          ]
        }
      };

      final motelModel = MotelModel.fromMap(jsonData);

      expect(motelModel.sucesso, true);
      expect(motelModel.pagina, 1);
      expect(motelModel.moteis.length, 2);
      expect(motelModel.moteis[0]["fantasia"], "Motel 1");
    });
  });
}
