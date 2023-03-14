import 'package:flutter/material.dart';
import 'package:two_foodapp/components/components.dart';
import 'package:two_foodapp/foodapp_theme.dart';

class RecipeCard2 extends StatelessWidget {
  const RecipeCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: const BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.softLight),
            image: AssetImage('assets/magazine_pics/mag2.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: [
            const AuthorCard(
              authorName: 'Krystian Petek',
              title: '.NET Developer',
              imageProvider: AssetImage('assets/images/author.png'),
            ),
            Expanded(
              child: Stack(children: [
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Text(
                    'App',
                    style: FoodAppTheme.lightTextTheme.headlineLarge,
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 70,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'Demonstrate',
                      style: FoodAppTheme.lightTextTheme.headlineLarge,
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
