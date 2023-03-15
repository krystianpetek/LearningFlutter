import 'package:flutter/material.dart';

import 'package:two_foodapp/components/components.dart';
import 'package:two_foodapp/models/models.dart';

class TodayRecipeListView extends StatelessWidget {
  const TodayRecipeListView({super.key, required this.recipes});

  final List<ExploreRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recipes of the Day !',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            color: Colors.transparent,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recipes.length,
              itemBuilder: (BuildContext context, int index) {
                final recipe = recipes[index];
                return buildCard(recipe);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 16),
            ),
            height: 400,
          )
        ],
      ),
    );
  }

  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return RecipeCard1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return RecipeCard2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return RecipeCard3(recipe: recipe);
    } else {
      throw Exception('This card doesn\'t exist yet');
    }
  }
}
