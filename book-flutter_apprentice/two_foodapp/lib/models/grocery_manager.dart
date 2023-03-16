import 'package:flutter/material.dart';
import 'package:two_foodapp/models/grocery_item_model.dart';

class GroceryManager extends ChangeNotifier {
  final _groceryItems = <GroceryItemModel>[];

  List<GroceryItemModel> get groceryItems => List.unmodifiable(_groceryItems);

  void deleteItem(int index) {
    _groceryItems.removeAt(index);
    notifyListeners();
  }

  void addItem(GroceryItemModel item) {
    _groceryItems.add(item);
    notifyListeners();
  }

  void updateItem(GroceryItemModel item, int index) {
    _groceryItems[index] = item;
    notifyListeners();
  }

  void completeItem(int index, bool change) {
    final item = _groceryItems[index];
    _groceryItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}
