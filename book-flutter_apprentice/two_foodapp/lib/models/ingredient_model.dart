part of 'explore_recipe_model.dart';

class IngredientsModel {
  String imageUrl;
  String title;
  String source;

  IngredientsModel(
      {required this.imageUrl, required this.source, required this.title});

  factory IngredientsModel.fromJson(Map<String, dynamic> json) {
    return IngredientsModel(
      imageUrl: json['imageUrl'] ?? '',
      source: json['source'] ?? '',
      title: json['title'] ?? '',
    );
  }
}
