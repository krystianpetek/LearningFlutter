import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:two_foodapp/models/models.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/images/empty_list.png'),
              ),
            ),
            Text(
              'No Groceries',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              'Shopping for ingredients?\nTap the + button to write them down!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            MaterialButton(
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Colors.green,
              onPressed: () {
                // Provider.of<AppStateManager>(context, listen: false).goToRecipes();
                context.goNamed(
                  'home',
                  params: {'tab': '${FoodAppTab.recipes}'},
                );
              },
              child: const Text('Browse Recipes'),
            )
          ],
        ),
      ),
    );
  }
}
