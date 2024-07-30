class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // of creates a new list based on old list, the argument that we pass to it
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
