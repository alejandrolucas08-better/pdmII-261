import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/item.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Item>> fetchItems() async {
    final Uri url = Uri.parse('$_baseUrl/posts');

    try {
      // A camada de servico concentra a comunicacao com a API REST.
      final http.Response response = await http.get(url).timeout(
            const Duration(seconds: 10),
          );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;

        return data
            .map((dynamic item) => Item.fromJson(item as Map<String, dynamic>))
            .toList();
      }

      throw ApiException(
        'Nao foi possivel carregar os dados. Codigo: ${response.statusCode}.',
      );
    } on TimeoutException {
      throw const ApiException('A requisicao demorou demais. Tente novamente.');
    } on FormatException {
      throw const ApiException(
        'A resposta da API veio em um formato inesperado.',
      );
    } on http.ClientException {
      throw const ApiException('Falha de conexao. Verifique sua internet.');
    } on ApiException {
      rethrow;
    } catch (_) {
      throw const ApiException(
        'Ocorreu um erro inesperado ao buscar os dados.',
      );
    }
  }
}

class ApiException implements Exception {
  final String message;

  const ApiException(this.message);

  @override
  String toString() => message;
}
