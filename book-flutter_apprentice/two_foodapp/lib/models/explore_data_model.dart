import 'models.dart';

class ExploreDataModel {
  final List<ExploreRecipeModel> todayRecipes;
  final List<PostModel> friendPosts;

  ExploreDataModel(this.todayRecipes, this.friendPosts);
}
