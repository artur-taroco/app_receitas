import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/recipe.dart';

class FavoritesService {
  static const String favoritesKey = 'favorites';

  Future<void> saveFavorite(Recipe recipe) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> favorites =
        prefs.getStringList(favoritesKey) ?? [];

    bool alreadyExists = favorites.any((item) {
      final data = jsonDecode(item);
      return data['id'] == recipe.id;
    });

    if (!alreadyExists) {
      favorites.add(
        jsonEncode(recipe.toJson()),
      );

      await prefs.setStringList(
        favoritesKey,
        favorites,
      );
    }
  }

  Future<List<Recipe>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> favorites =
        prefs.getStringList(favoritesKey) ?? [];

    return favorites.map((item) {
      return Recipe.fromStorage(
        jsonDecode(item),
      );
    }).toList();
  }

  Future<void> removeFavorite(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> favorites =
        prefs.getStringList(favoritesKey) ?? [];

    favorites.removeWhere((item) {
      final data = jsonDecode(item);
      return data['id'] == recipeId;
    });

    await prefs.setStringList(
      favoritesKey,
      favorites,
    );
  }
}