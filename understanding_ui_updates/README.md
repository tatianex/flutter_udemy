# flutter_udemy 

This repository contains one of the apps created during the Udemy course: *Flutter & Dart - The Complete Guide [2024 Edition]*. This app focuses on [insert app functionality], demonstrating key concepts in Flutter development, including state management, widget trees, and efficient UI updates.

- [Udemy course: Flutter & Dart - The Complete Guide](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/?couponCode=ACCAGE0923)

## What Was Covered in Section 7

In this section, we explored the following concepts:
- Widget Tree vs. Element Tree vs. Render Tree
- The role of `setState()` and efficient UI updates
- State management and the significance of keys
- Differences between `var`, `final`, and `const`

### Widget, Element, and Render Trees

| Widget Tree           | Element Tree                  | Render Tree                 |
|-----------------------|-------------------------------|-----------------------------|
| Combination of widgets| In-memory representation of   | The visible UI building     |
| in your code          | your widgets                  | blocks                      |
| build() is called     | Elements are re-used if       | Only (partially) re-rendered|
| frequently to check   | possible                      | if UI updates are needed    |
| for required updates  |                               |                             |

When we call `setState()`, the `build` method is called again. For complex apps with extensive widget trees, it's crucial to avoid updating widgets unnecessarily. This is why it's a good practice to keep your `StatefulWidgets` as small as needed.

**State Management:**
- State objects are not directly connected to `StatefulWidgets` but to the element objects in the tree.
- If the list of widgets is reordered, their state remains unchanged unless we introduce keys.

### State Management Example

| Widget Tree    | Element Tree       | Render Tree |
|----------------|--------------------|-------------|
| `TodoItem('A')`| `TodoItem Element` | `State A`   |
| `TodoItem('B')`| `TodoItem Element` | `State B`   |
| `TodoItem('C')`| `TodoItem Element` | `State C`   |

If this list is reordered, the state won't change. State doesn't move around.

Flutter determines whether an element can be reused by comparing the type of the element with the widget in the same position in the widget tree. This behavior changes if we introduce keys. With keys, Flutter tracks both the element type and the key, ensuring the state moves along with the widgets when they are reordered.

### Understanding `var`, `final`, and `const`

| CODE                            | Device Memory                    |
|---------------------------------|----------------------------------|
| `var users = ['Max']`           | 0x21d36e0 Users List (Max)       |
| Creates a new list object in    |                                  |
| memory and stores the address   |                                  |
| to the new object in the new    |                                  |
| variable.                       |                                  |
| `users = ['Max', 'Manu']`       | 0x53e44c1 Users List (Max, Manu) |
| Creates a new list object in    |                                  |
| memory and stores the address   |                                  |
| to the new object in the        |                                  |
| existing variable.              |                                  |

If we use `final` instead of `var`, we can't reassign the value (e.g., `users = []`), but we can still modify the content (e.g., `users.add('Manu')`). With `const`, neither reassignment nor content modification is allowed.

## Summary

In this section, we learned:
- How Flutter manages the widget, element, and render trees to efficiently update the UI.
- The importance of using keys with `StatefulWidgets` to maintain state consistency.
- The differences between `var`, `final`, and `const`, and how they impact memory and state management.
