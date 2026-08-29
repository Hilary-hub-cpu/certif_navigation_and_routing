import '../models/recipe.dart';

/// Jeu de données initial de l'application.
/// C'est la SEULE source de données "en dur" du projet, et elle est
/// volontairement isolée dans le dossier `data/`, loin des widgets.
/// Dans une vraie app, ce fichier serait remplacé par un appel API
/// ou une base de données locale (sqflite, hive, etc.).
class RecipesData {
  static List<Recipe> getInitialRecipes() {
    return [
      const Recipe(
        id: '1',
        title: 'Poulet rôti aux herbes',
        category: 'Plat principal',
        prepTimeMinutes: 75,
        difficulty: 'Moyen',
        description:
            'Un poulet fermier rôti au four avec thym, romarin et ail, '
            'accompagné de pommes de terre fondantes.',
        ingredients: [
          '1 poulet fermier',
          '4 gousses d\'ail',
          'Thym et romarin frais',
          '600g de pommes de terre',
          'Huile d\'olive, sel, poivre',
        ],
        imageEmoji: '🍗',
      ),
      const Recipe(
        id: '2',
        title: 'Tarte au citron meringuée',
        category: 'Dessert',
        prepTimeMinutes: 90,
        difficulty: 'Difficile',
        description:
            'Une pâte sablée croustillante, une crème au citron acidulée '
            'et une meringue légère dorée au chalumeau.',
        ingredients: [
          '1 pâte sablée',
          '3 citrons',
          '4 œufs',
          '150g de sucre',
          '80g de beurre',
        ],
        imageEmoji: '🍋',
      ),
      const Recipe(
        id: '3',
        title: 'Salade César',
        category: 'Entrée',
        prepTimeMinutes: 20,
        difficulty: 'Facile',
        description:
            'Une salade croquante avec poulet grillé, croûtons maison, '
            'parmesan et sauce César crémeuse.',
        ingredients: [
          'Laitue romaine',
          'Blanc de poulet',
          'Croûtons',
          'Parmesan',
          'Sauce César',
        ],
        imageEmoji: '🥗',
      ),
      const Recipe(
        id: '4',
        title: 'Pâtes carbonara',
        category: 'Plat principal',
        prepTimeMinutes: 25,
        difficulty: 'Facile',
        description:
            'La vraie recette italienne : pas de crème, juste des œufs, '
            'du parmesan, du guanciale et du poivre noir.',
        ingredients: [
          '400g de spaghetti',
          '150g de guanciale',
          '4 jaunes d\'œufs',
          '80g de parmesan',
          'Poivre noir',
        ],
        imageEmoji: '🍝',
      ),
      const Recipe(
        id: '5',
        title: 'Smoothie mangue-passion',
        category: 'Boisson',
        prepTimeMinutes: 10,
        difficulty: 'Facile',
        description:
            'Un smoothie tropical rafraîchissant, parfait pour bien '
            'commencer la journée.',
        ingredients: [
          '1 mangue',
          '2 fruits de la passion',
          '200ml de lait de coco',
          '1 cuillère de miel',
        ],
        imageEmoji: '🥭',
      ),
      const Recipe(
        id: '6',
        title: 'Fondant au chocolat',
        category: 'Dessert',
        prepTimeMinutes: 35,
        difficulty: 'Moyen',
        description:
            'Un cœur coulant au chocolat noir intense, à servir tiède '
            'avec une boule de glace vanille.',
        ingredients: [
          '200g de chocolat noir',
          '150g de beurre',
          '4 œufs',
          '120g de sucre',
          '50g de farine',
        ],
        imageEmoji: '🍫',
      ),
      const Recipe(
        id: '7',
        title: 'Soupe miso',
        category: 'Entrée',
        prepTimeMinutes: 15,
        difficulty: 'Facile',
        description:
            'Une soupe japonaise légère à base de pâte miso, tofu soyeux '
            'et algues wakamé.',
        ingredients: [
          '2 cuillères de pâte miso',
          '200g de tofu soyeux',
          'Algues wakamé',
          'Oignons verts',
        ],
        imageEmoji: '🍲',
      ),
      const Recipe(
        id: '8',
        title: 'Mojito virgin',
        category: 'Boisson',
        prepTimeMinutes: 8,
        difficulty: 'Facile',
        description:
            'Une version sans alcool du célèbre cocktail cubain, '
            'menthe fraîche et citron vert.',
        ingredients: [
          '1 citron vert',
          'Feuilles de menthe fraîche',
          'Eau gazeuse',
          'Sirop de sucre de canne',
        ],
        imageEmoji: '🍹',
      ),
    ];
  }

  static List<String> getCategories() {
    return ['Toutes', 'Entrée', 'Plat principal', 'Dessert', 'Boisson'];
  }
}
