import 'package:flutter/material.dart';

class Body2 extends StatelessWidget {
  const Body2({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Body 2 build');
    return const SizedBox(
      height: 200,
      child: Card(
        child: Text('Body 2'),
      ),
    );
  }
}
