import 'package:flutter/material.dart';
import 'package:meals_with_riverpod/data/dummy_data.dart';
import 'package:meals_with_riverpod/model/category.dart';
import 'package:meals_with_riverpod/model/meal.dart';
import 'package:meals_with_riverpod/screens/meals.dart';
import 'package:meals_with_riverpod/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    required this.availableMeals,
    super.key,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
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
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(begin: Offset(0, 0.30), end: Offset(0, 0)).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.decelerate,
          ),
        ),
        child: child,
      ),
    );
  }
}
