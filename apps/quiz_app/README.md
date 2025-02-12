# flutter_udemy

This is the second app created in the Udemy course

Flutter & Dart - The Complete Guide [2024 Edition]
A Complete Guide to the Flutter SDK &amp; Flutter Framework for building native iOS and Android apps
- [Udemy course: Flutter & Dart - The Complete Guide](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/?couponCode=ACCAGE0923)

# What was seen here - overview

IF inside of Lists:

The if statement is a crucial feature of the Dart language - actually, it's a core feature of pretty much all programming languages.

In addition to what you learned in the previous lecture, in Dart, you may also use if inside of lists to conditionally add items to lists:

final myList = [
  1,
  2,
  if (condition)
    3
];
In this example, the number 3 will only be added to myList if condition was met (condition can be true or false or a check that yields true or false - e.g., day == 'Sunday').

Please note that there are NO curly braces around the if statement body. The if statement body also only comprises the next line of code (i.e., you can't have multiple lines of code inside the if statement).

You can also specify an else case - an alternative value that may be inserted into the list if condition is not met:

final myList = [
  1,
  2,
  if (condition)
    3
  else
    4
];
Using this feature is optional. Alternatively, you could, for example, also work with a ternary expression:

final myList = [
  1,
  2,
  condition ? 3 : 4
];
Especially when inserting more complex values (e.g., a widget with multiple parameters being set) into a more complex list (e.g., a list of widgets passed to a Column() or Row()), this feature can lead to more readable code.

You will also see it being used later in the course. It will be explained again then.

You can also learn more about this feature here: https://github.com/dart-lang/language/blob/master/accepted/2.3/control-flow-collections/feature-specification.md

The spread operator

// map creates a new list with new objects
// ... this take all the values from the list and "return" then separeted on the list
// this is a chain we are calling a method on the result of another method
...currentQuestion.shuffledAnswers.map((answer) {
    return AnswerButton(
        answerText: answer,
        onTap: () {
        answerQuestion(answer);
        });
})

Get keyword

// This is a method which produces a list summary that it returns
// If you have methods like this which take no input values
// that just produces some data based on some class properties
// you can use a getter instead with the get keyword
// List<Map><String, Object>> getSummaryData() {
  List<Map<String, Object>> get summaryData {
    // this list is based on the chosenAnswers property
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
}

Make it private

_MyClass() {} String _name _value _sum()
Underscore is used to make things private be it a class, a property, a variable or a method

Arrow Function =>

For functions that only have a return statement inside of their body
It means it is a simple function which might take some input values
and which than immediatly returns something
it performs no other operations inside of the function body 
so instead of using:
() {
    return value;
}
we can use:
() => value