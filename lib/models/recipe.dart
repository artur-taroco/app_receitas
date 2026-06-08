class Recipe {
  final String id;
  final String name;
  final String image;
  final String category;
  final String instructions;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.instructions,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? '',
      image: json['strMealThumb'] ?? '',
      category: json['strCategory'] ?? '',
      instructions: json['strInstructions'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
  return {
    'id': id,
    'name': name,
    'image': image,
    'category': category,
    'instructions': instructions,
  };
}

factory Recipe.fromStorage(Map<String, dynamic> json) {
  return Recipe(
    id: json['id'],
    name: json['name'],
    image: json['image'],
    category: json['category'],
    instructions: json['instructions'],
  );
}
}
