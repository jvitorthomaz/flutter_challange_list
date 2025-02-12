import 'package:flutter_challange_motel_list/models/motel_model.dart';
import 'package:flutter_challange_motel_list/viewmodels/motel_viewmodel.dart';
import 'package:flutter_challange_motel_list/views/Home/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('HomeScreen displays loading indicator', (WidgetTester tester) async {
    final viewModel = MotelViewModel();
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: viewModel,
          child: HomeScreen(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('HomeScreen displays motel list', (WidgetTester tester) async {
    final viewModel = MotelViewModel();
    viewModel._motelData = MotelModel(
      sucesso: true,
      pagina: 1,
      qtdPorPagina: 10,
      totalSuites: 50,
      totalMoteis: 5,
      raio: 5.0,
      maxPaginas: 5.0,
      moteis: [
        {"fantasia": "Motel 1", "bairro": "Bairro 1", "logo": "http://example.com/logo1.png"},
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: viewModel,
          child: HomeScreen(),
        ),
      ),
    );

    expect(find.text("Motel 1"), findsOneWidget);
  });
}
