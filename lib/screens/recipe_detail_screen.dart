import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';

/// Écran 2/4 : détail d'une recette.
/// Reçoit l'identifiant de la recette en paramètre de route (voir router)
/// puis va chercher les données complètes dans le RecipeProvider.
class RecipeDetailScreen extends StatelessWidget {
  final String recipeId;

  const RecipeDetailScreen({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = context.watch<RecipeProvider>();
    final recipe = recipeProvider.getRecipeById(recipeId);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            actions: [
              IconButton(
                icon: Icon(
                  recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: recipe.isFavorite ? Colors.red : null,
                ),
                onPressed: () => recipeProvider.toggleFavorite(recipe.id),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(recipe.title),
              background: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                alignment: Alignment.center,
                child: Text(
                  recipe.imageEmoji,
                  style: const TextStyle(fontSize: 80),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    Chip(
                      avatar: const Icon(Icons.category_outlined, size: 18),
                      label: Text(recipe.category),
                    ),
                    Chip(
                      avatar: const Icon(Icons.timer_outlined, size: 18),
                      label: Text('${recipe.prepTimeMinutes} min'),
                    ),
                    Chip(
                      avatar: const Icon(Icons.bar_chart, size: 18),
                      label: Text(recipe.difficulty),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  recipe.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),
                if (recipe.ingredients.isNotEmpty) ...[
                  Text(
                    'Ingrédients',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  ...recipe.ingredients.map(
                    (ingredient) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle_outline, size: 18),
                          const SizedBox(width: 8),
                          Expanded(child: Text(ingredient)),
                        ],
                      ),
                    ),
                  ),
                ],
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
