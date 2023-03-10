import 'package:flutter/material.dart';
import 'package:one_recipes/recipe.dart';
import 'package:one_recipes/build_recipe_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return buildRecipeCart(Recipe.samples[index]);
            // return Card(
            //   child: Column(
            //     children: [
            //       Image.asset(Recipe.samples[index].imageUrl),
            //       Text(Recipe.samples[index].label),
            //     ],
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
