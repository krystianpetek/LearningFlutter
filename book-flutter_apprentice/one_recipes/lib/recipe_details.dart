import 'package:flutter/material.dart';
import 'package:one_recipes/recipe.dart';

class RecipeDetails extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetails({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetails> createState() {
    return _RecipeDetailsState();
  }
}

class _RecipeDetailsState extends State<RecipeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image(
              image: AssetImage(widget.recipe.imageUrl),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.recipe.label,
            style: const TextStyle(fontSize: 18),
          )
        ]),
      ),
    );
  }
}
