import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/recipe.dart';
import '../services/favorites_service.dart';

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;

  const DetailsScreen({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    final FavoritesService favoritesService =
        FavoritesService();

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            CachedNetworkImage(
              imageUrl: recipe.image,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,

              placeholder: (context, url) =>
                  const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                ),
              ),

              errorWidget:
                  (context, url, error) =>
                      const Icon(
                Icons.error,
                size: 50,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                recipe.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Chip(
                label: Text(recipe.category),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.favorite,
                ),
                label: const Text(
                  "Adicionar aos Favoritos",
                ),
                onPressed: () async {
                  await favoritesService
                      .saveFavorite(recipe);

                  if (context.mounted) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Receita adicionada aos favoritos!',
                        ),
                      ),
                    );
                  }
                },
              ),
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                "Modo de Preparo",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                recipe.instructions,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}