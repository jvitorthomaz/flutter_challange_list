import 'package:flutter/material.dart';
import 'package:flutter_challange_motel_list/views/Home/widgets/home_list_moteis.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_challange_motel_list/models/motel_model.dart';

void main() {
  testWidgets('MotelWidget deve exibir os detalhes do motel', (WidgetTester tester) async {
    final motel = MotelModel(
      fantasia: "Motel Teste",
      bairro: "Centro",
      logo: "https://example.com/logo.png",
      distancia: 5.2,
      qtdFavoritos: 10,
      suites: [],
    );

    await tester.pumpWidget(MaterialApp(home: MotelWidget(index: 0)));

    expect(find.text("Motel Teste"), findsOneWidget);
    expect(find.text("Centro"), findsOneWidget);
    expect(find.text("5.2 km de distância"), findsOneWidget);
    expect(find.text("10 favoritos"), findsOneWidget);
  });
}
