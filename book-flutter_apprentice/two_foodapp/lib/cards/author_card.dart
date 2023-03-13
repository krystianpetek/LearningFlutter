import 'package:flutter/material.dart';
import 'package:two_foodapp/circle_image.dart';
import 'package:two_foodapp/foodapp_theme.dart';

class AuthorCard extends StatefulWidget {
  const AuthorCard({
    super.key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  });

  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleImage(
                imageRadius: 28,
                imageProvider: widget.imageProvider,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: FoodAppTheme.lightTextTheme.headlineMedium,
                  ),
                  Text(
                    widget.title,
                    style: FoodAppTheme.lightTextTheme.headlineSmall,
                  ),
                ],
              )
            ],
          ),
          IconButton(
            onPressed: () {
              _isFavorited = !_isFavorited;
              setState(() {});
              const snackBar = SnackBar(content: Text('Favorite Pressed'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
            iconSize: 30,
            color: Colors.red,
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white)),
          )
        ],
      ),
    );
  }
}
