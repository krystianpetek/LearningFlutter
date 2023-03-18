import 'package:flutter/material.dart';
import 'package:three_recipe_finder/widgets/user_widget.dart';

import 'models/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                child: UserWidget(user: User.users[index]),
                onTap: () {
                  print(User.users[index].name);
                },
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 16,
                color: Colors.yellow,
              );
            },
            itemCount: User.users.length),
      ),
    );
  }
}
