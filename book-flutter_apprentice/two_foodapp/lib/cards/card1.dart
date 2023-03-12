import 'package:flutter/material.dart';
import 'package:two_foodapp/foodapp_theme.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key});
  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Krystian Petek';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img1.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Text(
              category,
              style: FoodAppTheme.darkTextTheme.bodySmall,
            ),
            Positioned(
              top: 20,
              child: Text(
                title,
                style: FoodAppTheme.darkTextTheme.headlineMedium,
              ),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              child: Text(
                description,
                style: FoodAppTheme.darkTextTheme.bodySmall,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: Text(
                chef,
                style: FoodAppTheme.darkTextTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
