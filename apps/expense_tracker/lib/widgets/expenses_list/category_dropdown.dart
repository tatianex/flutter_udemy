import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class CategoryDropdown extends StatelessWidget {
  const CategoryDropdown({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  final Category selectedCategory;
  final void Function(Category?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Category>(
      value: selectedCategory,
      items: Category.values
          .map(
            (category) => DropdownMenuItem(
              value: category,
              child: Text(
                category.name.toUpperCase(),
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
