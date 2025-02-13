import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "https://www.jsonkeeper.com/b/1IXK";

  Future<Map<String, dynamic>?> fetchMoteis() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final decodedJson = json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

        print("JSON recebido da API: ${jsonEncode(decodedJson)}");

        return decodedJson;
      } else {
        throw Exception("Erro ao carregar os dados: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Erro ao conectar à API: $e");
    }
  }
}
