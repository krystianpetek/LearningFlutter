class Recipe {
  String label;
  String imageUrl;
  int servings;
  List<Ingredient> ingredients;

  Recipe(
    this.label,
    this.imageUrl,
    this.servings,
    this.ingredients,
  );

  Recipe.fromJson(Map<String, dynamic> json)
      : label = json['label'],
        imageUrl = json['imageUrl'],
        servings = json['servings'],
        ingredients = json['ingredients'];

  Map<String, dynamic> toJson() => {
        'label': label,
        'imageUrl': imageUrl,
        'servings': servings,
        'ingredients': ingredients,
      };

  static List<Recipe> samples = [
    Recipe(
      'Spaghetti and Meatballs',
      'assets/1.jpg',
      4,
      <Ingredient>[
        Ingredient(1, 'box', 'Spaghetti'),
        Ingredient(4, '', 'Frozen Meatballs'),
        Ingredient(0.5, 'jar', 'sauce'),
      ],
    ),
    Recipe(
      'Tomato Soup',
      'assets/2.jpg',
      2,
      <Ingredient>[
        Ingredient(2, 'can', 'Tomato Soup'),
      ],
    ),
    Recipe(
      'Grilled Cheese',
      'assets/3.jpg',
      1,
      <Ingredient>[
        Ingredient(2, 'slices', 'Cheese'),
        Ingredient(2, 'slices', 'Bread'),
      ],
    ),
    Recipe(
      'Chocolate Chip Cookies',
      'assets/4.jpg',
      24,
      <Ingredient>[
        Ingredient(4, 'cups', 'flour'),
        Ingredient(2, 'cups', 'sugar'),
        Ingredient(0.5, 'cups', 'chocolate chips'),
      ],
    ),
    Recipe(
      'Taco Salad',
      'assets/5.jpg',
      1,
      <Ingredient>[
        Ingredient(4, 'oz', 'natchos'),
        Ingredient(3, 'oz', 'taco meat'),
        Ingredient(0.5, 'cup', 'cheese'),
        Ingredient(0.25, 'cup', 'chopped tomatoes'),
      ],
    ),
    Recipe(
      'Hawaiian Pizza',
      'assets/6.jpg',
      4,
      <Ingredient>[
        Ingredient(1, 'item', 'pizza'),
        Ingredient(1, 'cup', 'pineapple'),
        Ingredient(8, 'oz', 'ham'),
      ],
    ),
  ];
}

class Ingredient {
  double quantity;
  String measure;
  String name;

  Ingredient(
    this.quantity,
    this.measure,
    this.name,
  );
}
