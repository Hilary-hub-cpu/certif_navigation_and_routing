import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';

/// Écran 3/4 : formulaire d'ajout de recette.
/// Contient 4 champs validés : titre, catégorie, temps de préparation,
/// description. On utilise un [Form] + [GlobalKey<FormState>], l'approche
/// standard Flutter pour la validation.
class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _prepTimeController = TextEditingController();
  final _descriptionController = TextEditingController();

  String _selectedCategory = 'Plat principal';
  String _selectedDifficulty = 'Facile';

  static const _categories = ['Entrée', 'Plat principal', 'Dessert', 'Boisson'];
  static const _difficulties = ['Facile', 'Moyen', 'Difficile'];

  @override
  void dispose() {
    _titleController.dispose();
    _prepTimeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // Valide tous les champs du formulaire d'un coup.
    if (_formKey.currentState!.validate()) {
      context.read<RecipeProvider>().addRecipe(
            title: _titleController.text.trim(),
            category: _selectedCategory,
            prepTimeMinutes: int.parse(_prepTimeController.text.trim()),
            difficulty: _selectedDifficulty,
            description: _descriptionController.text.trim(),
          );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Recette ajoutée avec succès !')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nouvelle recette')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Champ 1 : titre (obligatoire, min 3 caractères)
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Titre de la recette',
                prefixIcon: Icon(Icons.restaurant_menu),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Le titre est obligatoire';
                }
                if (value.trim().length < 3) {
                  return 'Le titre doit contenir au moins 3 caractères';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Champ 2 : catégorie (dropdown)
            DropdownButtonFormField<String>(
              initialValue: _selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Catégorie',
                prefixIcon: Icon(Icons.category_outlined),
                border: OutlineInputBorder(),
              ),
              items: _categories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (value) {
                if (value != null) setState(() => _selectedCategory = value);
              },
            ),
            const SizedBox(height: 16),

            // Champ 3 : temps de préparation (obligatoire, numérique, > 0)
            TextFormField(
              controller: _prepTimeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Temps de préparation (minutes)',
                prefixIcon: Icon(Icons.timer_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Le temps de préparation est obligatoire';
                }
                final number = int.tryParse(value.trim());
                if (number == null) {
                  return 'Merci d\'entrer un nombre valide';
                }
                if (number <= 0) {
                  return 'Le temps doit être supérieur à 0';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Champ 4 : difficulté (segmented via dropdown)
              DropdownButtonFormField<String>(
              initialValue: _selectedDifficulty,
              decoration: const InputDecoration(
                labelText: 'Difficulté',
                prefixIcon: Icon(Icons.bar_chart),
                border: OutlineInputBorder(),
              ),
              items: _difficulties
                  .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                  .toList(),
              onChanged: (value) {
                if (value != null) setState(() => _selectedDifficulty = value);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Merci de choisir une difficulté';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Champ 5 (bonus) : description (obligatoire, min 10 caractères)
            TextFormField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Description',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.description_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'La description est obligatoire';
                }
                if (value.trim().length < 10) {
                  return 'Ajoute une description un peu plus détaillée (10 caractères min)';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            FilledButton.icon(
              onPressed: _submitForm,
              icon: const Icon(Icons.check),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('Enregistrer la recette'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
