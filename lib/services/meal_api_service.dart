import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class MealApiService {
  static const String baseUrl =
      'https://www.themealdb.com/api/json/v1/1/search.php?s=';

  Future<List<Recipe>> searchRecipes(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl$query'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['meals'] == null) {
        return [];
      }

      return (data['meals'] as List)
          .map((meal) => Recipe.fromJson(meal))
          .toList();
    }

    throw Exception('Erro ao carregar receitas');
  }
}