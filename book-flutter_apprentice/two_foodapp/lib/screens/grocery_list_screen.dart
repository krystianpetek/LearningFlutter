import 'package:flutter/material.dart';
import 'package:two_foodapp/components/components.dart';
import 'package:two_foodapp/models/models.dart';
import 'package:two_foodapp/screens/screens.dart';

class GroceryListScreen extends StatelessWidget {
  const GroceryListScreen({super.key, required this.manager});

  final GroceryManager manager;

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
          itemBuilder: (context, index) {
            final item = groceryItems[index];

            return InkWell(
              child: GroceryTile(
                key: Key(item.id),
                item: item,
                onComplete: (change) {
                  if (change != null) manager.completeItem(index, change);
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroceryItemScreen(
                      originalItem: item,
                      onCreate: (item) {},
                      onUpdate: (item) {
                        manager.updateItem(item, index);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 16,
            );
          },
          itemCount: groceryItems.length),
    );
  }
}
