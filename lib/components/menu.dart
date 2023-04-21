import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('menu body ');
    return Container(
      width: 250,
      color: Colors.blue.shade200,
      child: Column(
        children: const [
          Text('MENU'),
          Text('Menu Item 1'),
          Text('Menu Item 2'),
          Text('Menu Item 3'),
          Text('Menu Item 4'),
        ],
      ),
    );
  }
}
