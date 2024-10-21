import 'package:flutter/material.dart';
import 'package:meals_with_riverpod/data/dummy_data.dart';
import 'package:meals_with_riverpod/model/category.dart';
import 'package:meals_with_riverpod/model/meal.dart';
import 'package:meals_with_riverpod/screens/meals.dart';
import 'package:meals_with_riverpod/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    required this.availableMeals,
    super.key,
  });

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // This is one way of doing it:
        // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
        // This is another:
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
