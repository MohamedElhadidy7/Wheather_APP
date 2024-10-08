import 'package:flutter/material.dart';

class noWheather extends StatelessWidget {
  const noWheather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'there is no wheather here 😔 Srart',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'searching Now 🔎',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
