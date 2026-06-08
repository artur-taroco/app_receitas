import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/recipe.dart';
import '../services/meal_api_service.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  final MealApiService api =
      MealApiService();

  List<Recipe> recipes = [];

  final TextEditingController controller =
      TextEditingController();

  Future<void> searchRecipes() async {
    try {
      final result =
          await api.searchRecipes(
        controller.text,
      );

      setState(() {
        recipes = result;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            'Erro: $e',
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    controller.text = 'Chicken';

    searchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('App de Receitas'),
      ),
      body: Column(
        children: [

          Padding(
            padding:
                const EdgeInsets.all(12),
            child: TextField(
              controller: controller,
              decoration:
                  InputDecoration(
                labelText:
                    'Pesquisar receita',
                border:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                          12),
                ),
                suffixIcon:
                    IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed:
                      searchRecipes,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount:
                  recipes.length,
              itemBuilder:
                  (context, index) {
                final recipe =
                    recipes[index];

                return Card(
                  margin:
                      const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  elevation: 4,
                  child: ListTile(
                    leading:
                        CachedNetworkImage(
                      imageUrl:
                          recipe.image,
                      width: 60,
                      placeholder:
                          (context,
                                  url) =>
                              const CircularProgressIndicator(),
                      errorWidget:
                          (context,
                                  url,
                                  error) =>
                              const Icon(
                        Icons.error,
                      ),
                    ),
                    title: Text(
                      recipe.name,
                    ),
                    subtitle: Text(
                      recipe.category,
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
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}