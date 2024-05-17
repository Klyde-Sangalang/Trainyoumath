import 'dart:math';

class MathProblem {
  final String question;
  final List<String> options;
  final String correctAnswer;
  final String questionFirst;
  final String questionSecond;
  final String questionOperation;
  

  MathProblem({required this.question, required this.options, required this.correctAnswer, required this.questionFirst, required this.questionSecond, required this.questionOperation});
}

Random random = Random();

// Function to generate a random addition problem
MathProblem generateAdditionProblem() {
  int a = random.nextInt(100);
  int b = random.nextInt(100);
  int correctAnswer = a + b;
  List<String> options = generateOptions(correctAnswer);
  return MathProblem(
    question: '$a + $b = ?',
    options: options,
    correctAnswer: correctAnswer.toString(),
    questionFirst: '$a',
    questionSecond: '$b',
    questionOperation: '+',
  );
}

MathProblem generateSubstractionProblem() {
  int a = random.nextInt(100);
  int b = random.nextInt(100);
  int correctAnswer = a - b;
  List<String> options = generateOptions(correctAnswer);
  return MathProblem(
    question: '$a + $b = ?',
    options: options,
    correctAnswer: correctAnswer.toString(),
    questionFirst: '$a',
    questionSecond: '$b',
    questionOperation: '-',
  );
}

// Function to generate three close but incorrect answers
List<String> generateOptions(int correctAnswer) {
  List<String> options = [];
  options.add(correctAnswer.toString());
  for (int i = 0; i < 3; i++) {
    int offset = random.nextInt(20) - 10; // Generate a number between -10 and 10
    options.add((correctAnswer + offset).toString());
  }
  options.shuffle(); // Shuffle the options
  return options;
}

