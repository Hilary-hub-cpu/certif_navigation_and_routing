import 'package:flutter/material.dart';

/// Widget réutilisable n°2.
/// Barre de recherche générique. Ne connaît rien des recettes :
/// elle expose juste un [onChanged] pour rester indépendante des données.
class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const SearchBarWidget({
    super.key,
    required this.onChanged,
    this.hintText = 'Rechercher...',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
