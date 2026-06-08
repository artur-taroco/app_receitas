import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/recipe.dart';
import '../services/favorites_service.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() =>
      _FavoritesScreenState();
}

class _FavoritesScreenState
    extends State<FavoritesScreen> {

  final FavoritesService service =
      FavoritesService();

  List<Recipe> favorites = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final recipes =
        await service.getFavorites();

    setState(() {
      favorites = recipes;
    });
  }

  Future<void> removeFavorite(
      Recipe recipe) async {
    await service.removeFavorite(
      recipe.id,
    );

    loadFavorites();

    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            '${recipe.name} removida dos favoritos',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Receitas Favoritas',
        ),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text(
                'Nenhuma receita favorita',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final recipe =
                    favorites[index];

                return Card(
                  margin:
                      const EdgeInsets.all(8),
                  child: ListTile(
                    leading:
                        CachedNetworkImage(
                      imageUrl:
                          recipe.image,
                      width: 60,
                      placeholder:
                          (context, url) =>
                              const CircularProgressIndicator(),
                      errorWidget:
                          (context,
                                  url,
                                  error) =>
                              const Icon(
                        Icons.error,
                      ),
                    ),
                    title:
                        Text(recipe.name),
                    subtitle: Text(
                      recipe.category,
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () =>
                          removeFavorite(
                              recipe),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              DetailsScreen(
                            recipe:
                                recipe,
                          ),
                        ),
                      ).then((_) {
                        loadFavorites();
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}