import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import '../widgets/recipe_card.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/category_filter_chips.dart';
import '../widgets/empty_state_widget.dart';
import '../router/app_router.dart';

/// Écran 1/4 : liste des recettes.
/// Contient la recherche texte + le filtre par catégorie.
/// S'adapte à la taille de l'écran : GridView sur tablette,
/// ListView sur mobile (voir LayoutBuilder ci-dessous).
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Seuil de largeur au-delà duquel on considère qu'on est sur tablette.
  static const double _tabletBreakpoint = 700;

  @override
  Widget build(BuildContext context) {
    final recipeProvider = context.watch<RecipeProvider>();
    final recipes = recipeProvider.filteredRecipes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes recettes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Paramètres',
            onPressed: () => context.pushSettings(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarWidget(
              hintText: 'Rechercher une recette...',
              onChanged: recipeProvider.updateSearchQuery,
            ),
            const SizedBox(height: 12),
            CategoryFilterChips(
              categories: recipeProvider.categories,
              selectedCategory: recipeProvider.selectedCategory,
              onCategorySelected: recipeProvider.updateSelectedCategory,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: recipes.isEmpty
                  ? const EmptyStateWidget(
                      message: 'Aucune recette ne correspond à ta recherche')
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        final isTablet =
                            constraints.maxWidth >= _tabletBreakpoint;
                        return GridView.builder(
                          itemCount: recipes.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            // 2 colonnes sur mobile, 4 sur tablette.
                            crossAxisCount: isTablet ? 4 : 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: (context, index) {
                            final recipe = recipes[index];
                            return RecipeCard(
                              recipe: recipe,
                              onTap: () => context.pushRecipeDetail(recipe.id),
                              onFavoriteTap: () =>
                                  recipeProvider.toggleFavorite(recipe.id),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pushAddRecipe(),
        icon: const Icon(Icons.add),
        label: const Text('Nouvelle recette'),
      ),
    );
  }
}
