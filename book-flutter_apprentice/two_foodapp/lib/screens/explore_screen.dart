import 'package:flutter/material.dart';
import 'package:two_foodapp/components/components.dart';
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
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
              const SizedBox(
                height: 16,
              ),
              FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? [])
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
