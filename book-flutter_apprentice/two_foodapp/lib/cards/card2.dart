import 'package:flutter/material.dart';
import 'package:two_foodapp/cards/author_card.dart';

class Card2 extends StatelessWidget {
  const Card2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img2.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: const AuthorCard(
          authorName: 'Krystian Petek',
          title: '.NET Developer',
          imageProvider: AssetImage('assets/author.jpg'),
        ),
      ),
    );
  }
}
