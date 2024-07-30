# flutter_udemy

This is the first app created in the Udemy course

Flutter & Dart - The Complete Guide [2024 Edition]
A Complete Guide to the Flutter SDK &amp; Flutter Framework for building native iOS and Android apps
- [Udemy course: Flutter & Dart - The Complete Guide](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/?couponCode=ACCAGE0923)

# What was seen here - overview

Starting Flutter Apps

main.dart - this is the first file that is evalueted when the app starts in the device
than the code is parsed from top to bottom and compiled by dart and Flutter tools to native iOS and Android machine code
which than is executed on the mobile devices

1. main() function gets executed automatically by Dart when executing the compiled app on the target device
2. runApp() should be called inside of main() - runApp "tells" FLutter what to display on the screen (which elements to display)
3. Pass the to-be-displayed "widget tree" to runApp() - A "widget tree" is a combination of (nested) Flutter widgets that build the overall user interface

IT IS ALL ABOUT WIDGETS!

FLutter UI are created by combining and nesting widgets
Flutter provides many built in widgets like buttons, form inputs, layout widgets...
You can also build your own widgets based on the built in widgets

Understanding CLASSES

Dart is an object-oriented language
Every value is an object

Objects = Data Structures
Objects are data structures stored in computer memory
- Data Variable/properties
- Funcions/Methods

We create classes to gather data and logic functions together into one data structure

Understanding types

Dart is type-safe language
All values are of certain type

Stateless vs Statefull widgets

Stateless: 
- Don't manage any internal data
- Only update the screen if parent widget were updated ("re-rendered")

Should be your default use as often as possible

Stateful:
- Do manage internal data "state""
- When state changes, the widget is re-rendered & the UI is updated

Use whenever you have changing data that should cause UI updates

const to optimize performance the IDE will tell when you should use it
final can not be overwritten or change is similar to const a const in the end is also a final, but to the final you can declare it and set the value later the const needs to initiate with a value
var is to use when you need the value to be overwritten or update it later

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
