import 'package:flutter_challange_motel_list/services/api_service.dart';
import 'package:flutter_challange_motel_list/viewmodels/motel_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('MotelViewModel', () {
    test('should fetch motel data and update state', () async {
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

      final viewModel = MotelViewModel();
      viewModel._apiService = apiService;

      await viewModel.fetchMoteis();

      expect(viewModel.isLoading, false);
      expect(viewModel.error, null);
      expect(viewModel.motelData, isNotNull);
      expect(viewModel.motelData!.moteis.length, 1);
    });
  });
}
