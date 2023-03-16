part of 'explore_recipe_model.dart';

class InstructionModel {
  String imageUrl;
  String description;
  int durationInMinutes;

  InstructionModel({
    required this.imageUrl,
    required this.description,
    required this.durationInMinutes,
  });

  factory InstructionModel.fromJson(Map<String, dynamic> json) {
    return InstructionModel(
      imageUrl: json['imageUrl'] ?? '',
      description: json['description'] ?? '',
      durationInMinutes: json['durationInMinutes'] ?? '',
    );
  }
}
