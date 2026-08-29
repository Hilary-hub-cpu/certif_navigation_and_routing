import 'package:flutter/material.dart';
import '../models/recipe.dart';

/// Widget réutilisable n°1.
/// Affiche une recette sous forme de carte. Utilisé à la fois dans la
/// ListView (mobile) et la GridView (tablette) de l'écran d'accueil.
/// Ne contient aucune donnée en dur : tout vient du [Recipe] reçu en paramètre.
class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onTap,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: theme.colorScheme.primaryContainer,
                    alignment: Alignment.center,
                    child: Text(
                      recipe.imageEmoji,
                      style: const TextStyle(fontSize: 48),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.timer_outlined,
                              size: 14, color: theme.colorScheme.secondary),
                          const SizedBox(width: 4),
                          Text(
                            '${recipe.prepTimeMinutes} min',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 4,
              right: 4,
              child: IconButton(
                onPressed: onFavoriteTap,
                icon: Icon(
                  recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: recipe.isFavorite ? Colors.red : Colors.white,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
