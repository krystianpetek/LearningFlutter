import 'package:flutter/material.dart';
import 'package:one_recipes/recipe.dart';

Widget buildRecipeCart(Recipe recipe) {
  return Card(
    child: Column(
      children: <Widget>[
        Image.asset(recipe.imageUrl),
        Text(recipe.label),
      ],
    ),
  );
}
