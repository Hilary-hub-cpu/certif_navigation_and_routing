# 🍽️ Mes Recettes — App Flutter multi-écrans

Application Flutter de démonstration sur le thème des **recettes de cuisine**.
Projet réalisé pour valider la maîtrise des widgets Flutter, de la navigation
et de la séparation UI / données.

## 📱 Aperçu

| Accueil | Détail | Formulaire | Paramètres |
|---|---|---|---|
| ![Accueil](screenshots/home.png) | ![Détail](screenshots/detail.png) | ![Formulaire](screenshots/form.png) | ![Paramètres](screenshots/settings.png) |

> Remplace les images dans `screenshots/` par tes propres captures d'écran
> une fois l'app lancée (voir section Lancement ci-dessous).

## ✅ Fonctionnalités

- **4 écrans distincts** : Accueil (liste), Détail, Formulaire d'ajout, Paramètres
- **Navigation avec GoRouter** et routes nommées (`AppRoutes` dans `router/app_router.dart`)
- **Écran de liste** avec recherche texte en temps réel + filtre par catégorie (chips)
- **Écran de détail** recevant l'`id` de la recette en paramètre d'URL (`/recipe/:id`)
- **Formulaire avec validation** : 5 champs (titre, catégorie, temps de préparation,
  difficulté, description), chacun avec ses propres règles de validation
- **Thème clair / sombre** basculable depuis l'écran Paramètres (persistant pendant
  la session grâce à `ThemeProvider` + `provider`)
- **Responsive** : `LayoutBuilder` bascule automatiquement entre 2 colonnes (mobile)
  et 4 colonnes (tablette, largeur ≥ 700px) dans la grille de recettes
- **Aucune donnée en dur dans les widgets** : toutes les recettes viennent de
  `data/recipes_data.dart`, exposées via `RecipeProvider`

## 🧱 Architecture du projet

```
lib/
├── main.dart                     # Point d'entrée, thème, providers
├── models/
│   └── recipe.dart                # Modèle de données Recipe
├── data/
│   └── recipes_data.dart          # Données initiales (mock), isolées de l'UI
├── providers/
│   ├── theme_provider.dart        # État du thème clair/sombre
│   └── recipe_provider.dart       # Liste, recherche, filtres, favoris, ajout
├── router/
│   └── app_router.dart            # Routes nommées GoRouter + extensions
├── screens/
│   ├── home_screen.dart           # Écran 1 : liste + recherche + filtre
│   ├── recipe_detail_screen.dart  # Écran 2 : détail (paramètre d'URL)
│   ├── add_recipe_screen.dart     # Écran 3 : formulaire + validation
│   └── settings_screen.dart       # Écran 4 : thème + stats
└── widgets/
    ├── recipe_card.dart           # Widget réutilisable : carte de recette
    ├── search_bar_widget.dart     # Widget réutilisable : barre de recherche
    ├── category_filter_chips.dart # Widget réutilisable : chips de filtre
    └── empty_state_widget.dart    # Widget réutilisable : état "aucun résultat"
```

### Widgets Flutter utilisés (≥ 8 différents)

`Scaffold`, `AppBar` / `SliverAppBar`, `ListView` / `ListView.builder`,
`GridView.builder`, `Stack`, `Card`, `Form` / `TextFormField`,
`DropdownButtonFormField`, `ChoiceChip` / `Chip`, `SwitchListTile`,
`FloatingActionButton`, `CustomScrollView` / `Sliver*`, `InkWell`, `Wrap`.

## 🚀 Lancement du projet

### Prérequis

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installé (≥ 3.22)
- Un émulateur Android/iOS, un navigateur (pour le web), ou un appareil physique

### Étapes

```bash
# 1. Cloner le dépôt
git clone https://github.com/<ton-utilisateur>/<ton-repo>.git
cd <ton-repo>

# 2. Installer les dépendances
flutter pub get

# 3. Vérifier que tout est en ordre (optionnel mais recommandé)
flutter doctor

# 4. Lancer l'application
flutter run
```

Pour tester le mode responsive, lance l'app sur un simulateur tablette
(ou redimensionne la fenêtre Chrome si tu lances `flutter run -d chrome`) :
la grille passe de 2 à 4 colonnes au-delà de 700px de large.

### Générer un APK / build

```bash
flutter build apk        # Android
flutter build web        # Web
```

## 🛠️ Stack technique

- **Flutter** (Material 3)
- [`go_router`](https://pub.dev/packages/go_router) — navigation déclarative, routes nommées
- [`provider`](https://pub.dev/packages/provider) — gestion d'état (thème + données)

## 📝 Notes pédagogiques

Ce projet a été conçu pour illustrer, avec un niveau débutant en tête :

1. **Séparer les données de l'affichage** : `models/` + `data/` + `providers/`
   ne dépendent d'aucun widget. Les écrans ne font que lire ces données.
2. **Réutiliser des widgets** plutôt que dupliquer du code (`widgets/`).
3. **Naviguer proprement** avec des routes nommées plutôt que des `Navigator.push`
   avec des `MaterialPageRoute` dispersés partout.
4. **Valider un formulaire** avec la classe `Form` et un `GlobalKey<FormState>`.

## 📄 Licence

Projet pédagogique, libre d'utilisation.
