import 'package:flutter/material.dart';
import 'package:random_dog/Dog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Random Dog",
      home: Dog(),
    );
  }
}
