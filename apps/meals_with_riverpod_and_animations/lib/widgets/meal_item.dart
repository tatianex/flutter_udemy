import 'package:flutter/material.dart';
import 'package:meals_with_riverpod_and_animations/model/meal.dart';
import 'package:meals_with_riverpod_and_animations/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    required this.meal,
    required this.onSelectMeal,
    super.key,
  });

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          // Call detail meal screen
          onSelectMeal(meal);
        },
        // We use Stack when we want multiple widgets
        // to be positioned ON TOP of each other along the Z-Axis
        // e.g. a Text() on top of an Image()
        child: Stack(
          children: [
            // The widget in the bottom is the first here
            // The others will come on top
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            // And this Positioned has the constraints
            // it has its left and right fix width wich is passed to its children
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                // And this Column is inside of a Positioned
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Because this Row is inside of a column... read comments above
                    // So therefore this row is not unconstrained horizontally
                    // Positioned has the horizontal constraints
                    // That were passed to Container -> Column -> Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // This guy return a row
                        // So how come here we can use a row inside of a row
                        // without using expanded to wrap the inside row?
                        MealItemTrait(
                          icon: Icons.schedule,
                          // label: meal.duration.toString(),
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(width: 8),
                        MealItemTrait(
                          icon: Icons.schedule,
                          // label: meal.duration.toString(),
                          label: complexityText,
                        ),
                        const SizedBox(width: 8),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          // label: meal.duration.toString(),
                          label: affordabilityText,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
