/// Modèle représentant une recette.
/// Toutes les données affichées dans l'app passent par cette classe :
/// aucune valeur n'est écrite en dur directement dans les widgets.
class Recipe {
  final String id;
  final String title;
  final String category; // ex: "Dessert", "Plat principal", "Entrée"
  final int prepTimeMinutes;
  final String difficulty; // "Facile", "Moyen", "Difficile"
  final String description;
  final List<String> ingredients;
  final String imageEmoji; // on utilise un emoji pour éviter de gérer des assets réseau
  final bool isFavorite;

  const Recipe({
    required this.id,
    required this.title,
    required this.category,
    required this.prepTimeMinutes,
    required this.difficulty,
    required this.description,
    required this.ingredients,
    required this.imageEmoji,
    this.isFavorite = false,
  });

  Recipe copyWith({bool? isFavorite}) {
    return Recipe(
      id: id,
      title: title,
      category: category,
      prepTimeMinutes: prepTimeMinutes,
      difficulty: difficulty,
      description: description,
      ingredients: ingredients,
      imageEmoji: imageEmoji,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
