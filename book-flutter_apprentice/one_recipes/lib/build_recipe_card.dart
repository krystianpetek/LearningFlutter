import 'package:flutter/material.dart';
import 'package:one_recipes/recipe.dart';

Widget buildRecipeCart(Recipe recipe) {
  return Card(
    margin: const EdgeInsets.all(15),
    elevation: 2.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(recipe.imageUrl)),
          const SizedBox(height: 14.0),
          Text(
            recipe.label,
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palotino'),
          ),
        ],
      ),
    ),
  );
}
