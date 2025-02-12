# expense_tracker

This is the fourth app created in the Udemy course

Flutter & Dart - The Complete Guide [2024 Edition]
A Complete Guide to the Flutter SDK &amp; Flutter Framework for building native iOS and Android apps
- [Udemy course: Flutter & Dart - The Complete Guide](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/?couponCode=ACCAGE0923)

# What was seen here - overview
# Section 4: Handling User Input & Theming

This section covers important concepts for handling user input and managing theming in Flutter apps.

## User Input

- To show snack bars, we used:
    ```dart
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar()
    );
    ```

- We also learned how to display modals using the `showModalBottomSheet()` function:
    ```dart
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
    ```

- Handling user input was explored through:
  - **TextField()**
  - **DropDownButton()**

- We built a custom date picker using `showDatePicker()` and also explored how to display dialogs with `showDialog()`. In all these cases, **context** is crucial as it carries meta-information about the widget's position and relationship to other widgets, which Flutter uses to display additional UI elements.

- Managing input was done using **TextEditingController()**, but we learned that it’s important to call `dispose()` after using it to avoid memory leaks:
    ```dart
    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }
    ```

- We also covered how to pass pointers to functions between widgets so that child widgets can trigger functions that belong to their parent widgets.

## List Handling

- We used the **ListView** widget with its `builder` method to create efficient lists of unknown length.
  
- Additionally, we learned about the **Dismissible()** widget, which simplifies making list items swipeable and dismissible.

## Theming

- We explored how to set up theming by defining color themes and how to support both **light** and **dark** modes.
  
- To avoid setting up themes from scratch, we used the `copyWith()` method to inherit default theme settings and override only the values we needed:
    ```dart
    Theme.of(context).copyWith(
      colorScheme: ColorScheme.light(
        primary: Colors.purple,
      ),
    );
    ```

## Additional Widgets

- We worked with other widgets like:
  - **IconButton()**
  - **AppBar()**

---

This section provided foundational skills in handling user input and customizing app theming while ensuring efficient resource management and performance.

