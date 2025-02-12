import 'package:flutter_challange_motel_list/models/motel_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:flutter_challange_motel_list/viewmodels/motel_viewmodel.dart';
import 'package:flutter_challange_motel_list/services/api_service.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  group('MotelViewModel Tests', () {
    late MotelViewModel viewModel;
    late MockApiService mockApiService;

    setUp(() {
      mockApiService = MockApiService();
      viewModel = MotelViewModel(apiService: mockApiService);
    });

    test('Deve buscar os motéis corretamente', () async {
      final mockJson = {
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

      // Retornar um Map<String, dynamic> para combinar com o método fetchMoteis()
      when(mockApiService.fetchMoteis()).thenAnswer((_) async => mockJson);

      await viewModel.fetchMoteis();

      expect(viewModel.motelData, isNotNull);
      expect(viewModel.isLoading, false);
      expect(viewModel.error, isNull);
    });

    test('Deve lidar com erro na API', () async {
      when(mockApiService.fetchMoteis()).thenThrow(Exception("Erro na API"));

      await viewModel.fetchMoteis();

      expect(viewModel.error, isNotNull);
      expect(viewModel.motelData, isNull);
    });
  });
}
