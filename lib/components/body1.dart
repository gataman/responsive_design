import 'package:flutter/material.dart';

class Body1 extends StatelessWidget {
  const Body1({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    debugPrint('Body 1 build');
    return SizedBox(
      height: 300,
      child: Card(
        child: Text('Body 1 $title'),
      ),
    );
  }
}
