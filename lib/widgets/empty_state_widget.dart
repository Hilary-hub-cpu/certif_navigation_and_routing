import 'package:flutter/material.dart';

/// Widget réutilisable bonus (4e widget réutilisable).
/// Affiché quand une recherche ne donne aucun résultat.
class EmptyStateWidget extends StatelessWidget {
  final String message;
  final IconData icon;

  const EmptyStateWidget({
    super.key,
    this.message = 'Aucun résultat trouvé',
    this.icon = Icons.search_off,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 64, color: theme.disabledColor),
          const SizedBox(height: 12),
          Text(
            message,
            style: theme.textTheme.bodyLarge?.copyWith(color: theme.disabledColor),
          ),
        ],
      ),
    );
  }
}
