import 'package:flutter/material.dart';

import 'package:two_foodapp/components/components.dart';
import 'package:two_foodapp/models/models.dart';

class FriendPostTile extends StatelessWidget {
  const FriendPostTile({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleImage(
          imageProvider: AssetImage(post.profileImageUrl),
          imageRadius: 20,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.comment),
              Text(
                '${post.timestamp} mins ago',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
