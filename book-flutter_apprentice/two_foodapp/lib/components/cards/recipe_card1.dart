import 'package:flutter/material.dart';
import 'package:two_foodapp/foodapp_theme.dart';

import '../../models/models.dart';

class RecipeCard1 extends StatelessWidget {
  const RecipeCard1({super.key, required this.recipe});
  final ExploreRecipe recipe;

  final String chef = 'Krystian Petek';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Text(
              recipe.title,
              style: FoodAppTheme.darkTextTheme.bodySmall,
            ),
            Positioned(
              top: 20,
              child: Text(
                recipe.title,
                style: FoodAppTheme.darkTextTheme.headlineMedium,
              ),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              child: Text(
                recipe.message,
                style: FoodAppTheme.darkTextTheme.bodySmall,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: Text(
                chef,
                style: FoodAppTheme.darkTextTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
