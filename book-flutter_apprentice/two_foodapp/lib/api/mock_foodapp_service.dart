import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:two_foodapp/models/models.dart';

class MockFoodAppService {
  Future<ExploreDataModel> getExploreData() async {
    final todayRecipes = await _getTodayRecipes();
    final friendPosts = await _getFriendFeed();

    return ExploreDataModel(todayRecipes, friendPosts);
  }

  Future<List<ExploreRecipeModel>> _getTodayRecipes() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    final dataString =
        await _loadAsset('assets/sample_data/sample_explore_recipes.json');
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['recipes'] != null) {
      final recipes = <ExploreRecipeModel>[];

      json['recipes']
          .forEach((v) => {recipes.add(ExploreRecipeModel.fromJson(v))});
      return recipes;
    } else {
      return [];
    }
  }

  Future<List<PostModel>> _getFriendFeed() async {
    await Future.delayed(const Duration(microseconds: 1000));

    final dataString =
        await _loadAsset('assets/sample_data/sample_friends_feed.json');
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['feed'] != null) {
      final posts = <PostModel>[];
      json['feed'].forEach((v) {
        posts.add(PostModel.fromJson(v));
      });
      return posts;
    } else {
      return [];
    }
  }

  Future<List<SimpleRecipeModel>> getRecipes() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    final dataString =
        await _loadAsset('assets/sample_data/sample_recipes.json');
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['recipes'] != null) {
      final recipes = <SimpleRecipeModel>[];

      json['recipes']
          .forEach((v) => {recipes.add(SimpleRecipeModel.fromJson(v))});
      return recipes;
    } else {
      return [];
    }
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
