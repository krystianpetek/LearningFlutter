class Recipe {
  String label;
  String imageUrl;

  Recipe(
    this.label,
    this.imageUrl,
  );

  static List<Recipe> samples = [
    Recipe(
      'Spaghetti and Meatballs',
      'assets/1.jpg',
    ),
    Recipe(
      'Tomato Soup',
      'assets/2.jpg',
    ),
    Recipe(
      'Grilled Cheese',
      'assets/3.jpg',
    ),
    Recipe(
      'Chocolate Chip Cookies',
      'assets/4.jpg',
    ),
    Recipe(
      'Taco Salad',
      'assets/5.jpg',
    ),
    Recipe(
      'Hawaiian Pizza',
      'assets/6.jpg',
    )
  ];
}
