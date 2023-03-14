import 'package:flutter/material.dart';

import 'components.dart';
import '../models/models.dart';

class FriendPostListView extends StatelessWidget {
  const FriendPostListView({super.key, required this.friendPosts});

  final List<Post> friendPosts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Chefs',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.separated(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final post = friendPosts[index];
                return FriendPostTile(post: post);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
              itemCount: friendPosts.length),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
