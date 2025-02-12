import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key, required this.onCancel, required this.onSave});

  final void Function() onCancel;
  final void Function() onSave;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, // Aligns the buttons at the end
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onCancel,
          child: const Text('Cancel'),
        ),
        const SizedBox(width: 8), // Adds minimal space between the buttons
        ElevatedButton(
          onPressed: onSave,
          child: const Text('Save expense'),
        ),
      ],
    );
  }
}
