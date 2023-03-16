import 'package:flutter/painting.dart';

enum ImportanceEnum {
  low,
  medium,
  high;
}

class GroceryItemModel {
  final String id;
  final String name;
  final ImportanceEnum importance;
  final Color color;
  final int quantity;
  final DateTime date;
  final bool isComplete;

  GroceryItemModel({
    required this.id,
    required this.name,
    required this.importance,
    required this.color,
    required this.quantity,
    required this.date,
    this.isComplete = false,
  });

  GroceryItemModel copyWith({
    String? id,
    String? name,
    ImportanceEnum? importance,
    Color? color,
    int? quantity,
    DateTime? date,
    bool? isComplete,
  }) {
    return GroceryItemModel(
        id: id ?? this.id,
        name: name ?? this.name,
        importance: importance ?? this.importance,
        color: color ?? this.color,
        quantity: quantity ?? this.quantity,
        date: date ?? this.date,
        isComplete: isComplete ?? this.isComplete);
  }
}
