import 'package:flutter/material.dart';
import 'package:shopping_list/model/grocery_item.dart';

class ShoppingListMainPage extends StatelessWidget {
  const ShoppingListMainPage({
    required this.items,
    super.key,
  });

  final List<GroceryItem> items;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...items.map((element) => Material(
              child: ListTile(
                title: Text(element.name),
                subtitle: Text(element.category.title),
                leading: Icon(
                  Icons.ac_unit,
                  color: element.category.color,
                ),
                trailing: Text(element.quantity.toString()),
              ),
            ))
      ],
    ));
  }
}
