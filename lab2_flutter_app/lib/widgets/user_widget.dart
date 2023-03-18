import 'package:flutter/material.dart';

import '../models/user.dart';

class UserWidget extends StatelessWidget {
  final User user;

  const UserWidget({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.blue,
          ),
          const SizedBox(width: 30),
          Column(
            children: [
              Text(
                user.surname,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                user.name,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
