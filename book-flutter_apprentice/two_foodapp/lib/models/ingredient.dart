part of 'explore_recipe.dart';

class Ingredients {
  String imageUrl;
  String title;
  String source;

  Ingredients(
      {required this.imageUrl, required this.source, required this.title});

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
      imageUrl: json['imageUrl'] ?? '',
      source: json['source'] ?? '',
      title: json['title'] ?? '',
    );
  }
}
