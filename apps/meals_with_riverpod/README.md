# flutter_udemy

The meals app uses the fith app, the meals app, updated to use riverpod

Flutter & Dart - The Complete Guide [2024 Edition]
A Complete Guide to the Flutter SDK &amp; Flutter Framework for building native iOS and Android apps
- [Udemy course: Flutter & Dart - The Complete Guide](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/?couponCode=ACCAGE0923)

# What was seen here - overview

# Section 9: Managing App-wide State

In this course section we learned about providers with help of the Riverpod package which is one of many options we have for managing global state, or cross widget state, meaning states that affects multiple widgets

This provider can provide a potencially dynamic value and it can also provide methods that may change that value in the end, and then in our application in any of our widgets, not just our screen widgets, but any widgets, we can set up a consumer that is connected automatically by the riverpod package.

In that consumer widget we can now listen to changes through that provider value or even trigger those changes by calling those methods that might be provided by provider, and because we now have this central provider and any widget can set up a consumer we don't need to pass this cross-state management values between widgets anymore
