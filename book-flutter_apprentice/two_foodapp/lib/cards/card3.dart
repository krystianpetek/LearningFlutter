import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:two_foodapp/foodapp_theme.dart';

class Card3 extends StatelessWidget {
  const Card3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          height: 450,
          width: 350,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img3.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(height: 8),
                Text(
                  'Coding Trends',
                  style: FoodAppTheme.darkTextTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Chip(
                        label: Text(
                          'Flutter',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        backgroundColor: Colors.white.withOpacity(0.1),
                        onDeleted: () {
                          if (kDebugMode) {
                            print('delete Flutter');
                          }
                        },
                      ),
                      Chip(
                        label: Text(
                          '.NET',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        backgroundColor: Colors.white.withOpacity(0.1),
                      ),
                      Chip(
                        label: Text('React',
                            style: Theme.of(context).textTheme.bodySmall),
                        backgroundColor: Colors.white.withOpacity(0.1),
                        onDeleted: () {
                          if (kDebugMode) {
                            print('delete React');
                          }
                        },
                      ),
                      Chip(
                        label: Text(
                          'TypeScript',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        backgroundColor: Colors.white.withOpacity(0.1),
                        onDeleted: () {
                          if (kDebugMode) {
                            print('delete TypeScript');
                          }
                        },
                      ),
                      Chip(
                        label: Text('Angular',
                            style: Theme.of(context).textTheme.bodySmall),
                        backgroundColor: Colors.white.withOpacity(0.1),
                      ),
                      Chip(
                        label: Text(
                          'Blazor',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        backgroundColor: Colors.white.withOpacity(0.1),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
