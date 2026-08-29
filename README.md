# Mes Recettes - App Flutter

Application mobile développée avec Flutter dans le cadre d'un exercice sur la navigation multi-écrans.

Le thème choisi : une app de recettes de cuisine, avec une liste de recettes, une page de détail, un formulaire pour en ajouter une nouvelle, et un écran de paramètres pour changer de thème.

## Fonctionnalités

- 4 écrans : Accueil, Détail d'une recette, Formulaire d'ajout, Paramètres
- Navigation gérée avec GoRouter (routes nommées)
- Recherche par nom de recette + filtre par catégorie sur l'écran d'accueil
- Écran de détail qui reçoit l'id de la recette passé dans l'URL
- Formulaire avec validation sur 5 champs (titre, catégorie, temps de préparation, difficulté, description)
- Thème clair/sombre à activer depuis les paramètres
- Affichage responsive : la grille passe de 2 à 4 colonnes selon la largeur de l'écran

## Organisation du code

lib/
main.dart
models/ -> le modèle Recipe
data/ -> les données de départ (mockées)
providers/ -> gestion d'état (thème + recettes) avec Provider
router/ -> configuration GoRouter
screens/ -> les 4 écrans
widgets/ -> widgets réutilisables (carte recette, barre de recherche, chips de filtre, état vide)


J'ai essayé de séparer les données de l'affichage : les écrans ne font qu'afficher ce que les providers leur donnent, rien n'est écrit en dur dans les widgets.

## Comment lancer le projet

Il faut avoir Flutter installé sur sa machine.

git clone https://github.com/TON-PSEUDO/TON-REPO.git
cd TON-REPO
flutter pub get
flutter run


Un menu va te proposer de choisir un appareil (Chrome, un émulateur si tu en as un configuré, etc.)

## Technos utilisées

- Flutter (Material 3)
- go_router pour la navigation
- provider pour la gestion d'état

## Captures d'écran

![Accueil](screenshots/home.png)
![Détail](screenshots/detail.png)
![Formulaire](screenshots/form.png)
![Paramètres](screenshots/settings.png)
