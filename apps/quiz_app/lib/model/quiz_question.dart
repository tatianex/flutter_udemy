class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  // This method is just a getter
  // List<String> getShuffledAnswers() {
  //   // of creates a new list based on old list, the argument that we pass to it
  //   final shuffledList = List.of(answers);
  //   shuffledList.shuffle();
  //   return shuffledList;
  // }

  // Which can be replaced by this:
  // this way it can be used like a property while internally by dart
  // it is still executed as a method
  List<String> get shuffledAnswers {
    // of creates a new list based on old list, the argument that we pass to it
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
