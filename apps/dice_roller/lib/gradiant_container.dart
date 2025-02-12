import 'package:flutter/material.dart';
import 'package:flutter_udemy/dice_roller.dart';
import 'package:flutter_udemy/styled_text.dart';

const startAlignment = Alignment.topLeft;
const endtAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  // This is the verbose way of doing it
  // const GradientContainer({mykey}): super(key: mykey);
  const GradientContainer({super.key, required this.colors});
  // The named arguments are not required, by default they can be null
  // to make named arguments required we have to use the required keyword

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endtAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}

// class GradientContainer extends StatelessWidget {
//   // The positional arguments are always required
//   const GradientContainer(this.color1, this.color2, {super.key});

//   final Color color1;
//   final Color color2;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [color1, color2],
//           begin: startAlignment,
//           end: endtAlignment,
//         ),
//       ),
//       child: const Center(
//         child: StyledText(text: 'Now I can it call what I want'),
//       ),
//     );
//   }
// }

class GradientContainerWithListOfColors extends StatelessWidget {
  // The positional arguments are always required
  const GradientContainerWithListOfColors({super.key, required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endtAlignment,
        ),
      ),
      child: const Center(
        child: StyledText(text: 'Now I can it call what I want'),
      ),
    );
  }
}
