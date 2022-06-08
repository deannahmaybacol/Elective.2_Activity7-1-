import 'package:flutter/material.dart';
import 'intro_page.dart';

void main() => runApp(const CardCounter());

class CardCounter extends StatelessWidget {
  const CardCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
