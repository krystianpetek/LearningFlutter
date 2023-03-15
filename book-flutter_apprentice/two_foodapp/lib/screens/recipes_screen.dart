import 'package:flutter/material.dart';
import 'package:two_foodapp/api/mock_foodapp_service.dart';
import 'package:two_foodapp/components/components.dart';
import 'package:two_foodapp/models/models.dart';

class RecipesScreen extends StatelessWidget {
  RecipesScreen({super.key});

  final exploreService = MockFoodAppService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
      builder:
          (BuildContext context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: RecipesGridView(
              recipes: snapshot.data ?? [],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
