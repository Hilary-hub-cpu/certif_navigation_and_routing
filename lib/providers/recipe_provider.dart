import 'package:flutter/material.dart';
import '../data/recipes_data.dart';
import '../models/recipe.dart';

/// Gère la liste des recettes, la recherche par texte, le filtre par
/// catégorie, l'ajout de nouvelles recettes (depuis le formulaire) et
/// les favoris. C'est le "cerveau" des données de l'application :
/// les écrans ne font que lire et afficher ce que ce provider expose.
class RecipeProvider extends ChangeNotifier {
  final List<Recipe> _allRecipes = RecipesData.getInitialRecipes();

  String _searchQuery = '';
  String _selectedCategory = 'Toutes';

  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;
  List<String> get categories => RecipesData.getCategories();

  /// Liste filtrée selon la recherche texte + la catégorie sélectionnée.
  List<Recipe> get filteredRecipes {
    return _allRecipes.where((recipe) {
      final matchesCategory =
          _selectedCategory == 'Toutes' || recipe.category == _selectedCategory;
      final matchesSearch =
          recipe.title.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  Recipe getRecipeById(String id) {
    return _allRecipes.firstWhere((r) => r.id == id);
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void updateSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void toggleFavorite(String id) {
    final index = _allRecipes.indexWhere((r) => r.id == id);
    if (index != -1) {
      _allRecipes[index] = _allRecipes[index].copyWith(
        isFavorite: !_allRecipes[index].isFavorite,
      );
      notifyListeners();
    }
  }

  /// Ajoute une nouvelle recette créée via le formulaire.
  void addRecipe({
    required String title,
    required String category,
    required int prepTimeMinutes,
    required String difficulty,
    required String description,
  }) {
    final newRecipe = Recipe(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      category: category,
      prepTimeMinutes: prepTimeMinutes,
      difficulty: difficulty,
      description: description,
      ingredients: const [],
      imageEmoji: '🍽️',
    );
    _allRecipes.insert(0, newRecipe);
    notifyListeners();
  }
}
