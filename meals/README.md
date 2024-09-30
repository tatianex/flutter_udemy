# flutter_udemy

The meals app is the fith app created in the Udemy course

Flutter & Dart - The Complete Guide [2024 Edition]
A Complete Guide to the Flutter SDK &amp; Flutter Framework for building native iOS and Android apps
- [Udemy course: Flutter & Dart - The Complete Guide](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/?couponCode=ACCAGE0923)

# What was seen here - overview

# Section 8: Navigation & Multi-Screen Apps

This section covers essential topics related to navigation in Flutter apps:

- **Allowing users to navigate between screens**
- **Managing screen stacks**
- **Working with tab bars**
- **Using side drawers**

## A Stack of Screens

In Flutter, screens are visualized as a stack of layers, with the user always interacting with the topmost screen. When a new screen is presented, it is **pushed** onto the stack, overlaying the previous screen. Conversely, **popping** a screen removes the topmost layer, revealing the screen beneath it.

For example, in the **Meals App**, the initial screen displays a list of meal categories. Selecting a meal leads to a detailed screen showing the meal's ingredients and cooking instructions. This new screen is pushed onto the stack. You can mark meals as favorites, which are then accessible through the **Favorites Tab**. Filters can also be applied to alter the category view without affecting the favorites list.

### Navigation Code Examples

- To **pop** (remove) the current screen from the stack:
    ```dart
    Navigator.of(context).pop();
    ```

- To **push** (navigate to) a new screen:
    ```dart
    Navigator.of(context).push();
    ```

- To **replace** the current screen with a new one:
    ```dart
    Navigator.of(context).pushReplacement();
    ```

## Additional Navigation Features

- **BottomNavigationBar**: We implemented a tab bar for switching between different sections of the app (e.g., categories and favorites).
- **Side Drawer**: A side drawer was added for additional navigation options.
- **Passing Data**: We also covered how to pass data between screens, a topic that will be further explored in the next section.
