import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/recipe_detail_screen.dart';
import '../screens/add_recipe_screen.dart';
import '../screens/settings_screen.dart';

/// Noms de routes centralisés : évite les fautes de frappe sur les chaînes
/// de caractères dispersées dans tout le code.
class AppRoutes {
  static const home = 'home';
  static const recipeDetail = 'recipeDetail';
  static const addRecipe = 'addRecipe';
  static const settings = 'settings';
}

/// Déclaration de toutes les routes de l'application avec GoRouter.
/// Chaque route a un `name` (route nommée) et un chemin (`path`).
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
      routes: [
        // Route enfant avec un paramètre dynamique `:id`
        GoRoute(
          path: 'recipe/:id',
          name: AppRoutes.recipeDetail,
          builder: (context, state) {
            final recipeId = state.pathParameters['id']!;
            return RecipeDetailScreen(recipeId: recipeId);
          },
        ),
        GoRoute(
          path: 'add-recipe',
          name: AppRoutes.addRecipe,
          builder: (context, state) => const AddRecipeScreen(),
        ),
        GoRoute(
          path: 'settings',
          name: AppRoutes.settings,
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);

/// Petites extensions pour naviguer facilement depuis n'importe quel
/// écran sans répéter `GoRouter.of(context).pushNamed(...)` partout.
extension AppNavigation on BuildContext {
  void pushRecipeDetail(String recipeId) {
    pushNamed(AppRoutes.recipeDetail, pathParameters: {'id': recipeId});
  }

  void pushAddRecipe() {
    pushNamed(AppRoutes.addRecipe);
  }

  void pushSettings() {
    pushNamed(AppRoutes.settings);
  }
}
