import 'package:flutter_challange_motel_list/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('ApiService', () {
    test('should fetch motel data successfully', () async {
      final mockClient = MockClient((request) async {
        return http.Response('''
          {
            "sucesso": true,
            "data": {
              "pagina": 1,
              "qtdPorPagina": 10,
              "totalSuites": 50,
              "totalMoteis": 5,
              "raio": 5.0,
              "maxPaginas": 5.0,
              "moteis": [
                {"fantasia": "Motel 1", "bairro": "Bairro 1", "logo": "http://example.com/logo1.png"}
              ]
            }
          }
        ''', 200);
      });

      final apiService = ApiService();
      apiService.client = mockClient;

      final result = await apiService.fetchMoteis();

      expect(result.sucesso, true);
      expect(result.moteis.length, 1);
      expect(result.moteis[0]["fantasia"], "Motel 1");
    });

    test('should throw an exception on error', () async {
      final mockClient = MockClient((request) async {
        return http.Response('Error', 404);
      });

      final apiService = ApiService();
      apiService.client = mockClient;

      expect(() => apiService.fetchMoteis(), throwsException);
    });
  });
}
