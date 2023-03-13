import 'package:flutter/material.dart';

import '../api/mock_foodapp_service.dart';
import '../models/explore_data.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  final mockService = MockFoodAppService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final recipes = snapshot.data?.todayRecipes ?? [];

            return Center(
              child: Container(child: const Text('Show TodayRecipeListView')),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
