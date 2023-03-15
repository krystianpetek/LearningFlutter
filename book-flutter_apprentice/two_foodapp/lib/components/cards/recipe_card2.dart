import 'package:flutter/material.dart';
import 'package:two_foodapp/foodapp_theme.dart';

import 'package:two_foodapp/components/components.dart';
import 'package:two_foodapp/models/models.dart';

class RecipeCard2 extends StatelessWidget {
  const RecipeCard2({super.key, required this.recipe});

  final ExploreRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter:
                const ColorFilter.mode(Colors.white, BlendMode.softLight),
            image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: [
            AuthorCard(
              authorName: 'Krystian Petek',
              title: recipe.role,
              imageProvider: const AssetImage('assets/images/author.png'),
            ),
            Expanded(
              child: Stack(children: [
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Text(
                    recipe.title,
                    style: FoodAppTheme.lightTextTheme.headlineLarge,
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 70,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      recipe.subtitle,
                      style: FoodAppTheme.lightTextTheme.headlineLarge,
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
