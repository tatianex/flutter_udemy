import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

// By convention use _ and the name of the class followed by State
class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/dice_images/dice-$currentDiceRoll.png',
          width: 200,
        ),
        // This is another way of adding space between widgets
        const SizedBox(height: 20),
        TextButton(
          // onPressed: () {}, // anonimous function it does not have a name
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // This is one way of adding space between the image and the button text
            // padding: const EdgeInsets.only(top: 20),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Rool dice'),
        ),
        const SizedBox(
          height: 120,
        ),
      ],
    );
  }
}
