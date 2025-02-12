import 'package:flutter/material.dart';

class AmountInput extends StatelessWidget {
  const AmountInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        prefixText: '\$',
        label: Text('Amount'),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );
  }
}
