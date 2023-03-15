import 'package:flutter/material.dart';
import 'package:two_foodapp/models/grocery_item.dart';

class GroceryItemScreen extends StatefulWidget {
  const GroceryItemScreen(
      {super.key,
      required this.onCreate,
      required this.onUpdate,
      this.originalItem})
      : isUpdating = (originalItem != null);

  final Function(GroceryItem) onCreate;
  final Function(GroceryItem) onUpdate;
  final GroceryItem? originalItem;
  final bool isUpdating;

  @override
  State<StatefulWidget> createState() {
    return GroceryItemScreenState();
  }
}

class GroceryItemScreenState extends State<GroceryItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.orange);
  }
}
