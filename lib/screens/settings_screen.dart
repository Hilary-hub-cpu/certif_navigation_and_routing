import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/recipe_provider.dart';

/// Écran 4/4 : paramètres.
/// Permet de basculer entre thème clair et sombre, et affiche
/// quelques statistiques simples issues du RecipeProvider.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final recipeProvider = context.watch<RecipeProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: SwitchListTile(
              title: const Text('Thème sombre'),
              subtitle: const Text('Activer l\'affichage en mode sombre'),
              secondary: Icon(
                themeProvider.isDarkMode
                    ? Icons.dark_mode
                    : Icons.light_mode_outlined,
              ),
              value: themeProvider.isDarkMode,
              onChanged: themeProvider.toggleTheme,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Statistiques',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Nombre total de recettes : ${recipeProvider.filteredRecipes.length}',
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Catégories disponibles : ${recipeProvider.categories.length - 1}',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Card(
            child: ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('À propos'),
              subtitle: Text(
                'App de démonstration Flutter — navigation, formulaires, '
                'thème, widgets réutilisables.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
