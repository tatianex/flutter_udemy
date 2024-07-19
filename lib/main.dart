import 'package:flutter/material.dart';
import 'package:flutter_udemy_first/gradiant_container.dart';

void main() {
  // This is the key instruction that we must have in every flutter app we build runApp();
  // functions are simple instrucions that can be executed in our code
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colors: [
            Color.fromARGB(255, 28, 6, 80),
            Color.fromARGB(255, 27, 19, 139),
          ],
        ),
      ),
    ),
  );
}
