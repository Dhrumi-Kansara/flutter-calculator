import 'package:math_expressions/math_expressions.dart';

class Calculator {

  static final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

static final List<String> buttonsLandscape = [
    'C',
    'DEL',
    '%',
    '/',
    '-',
    'x',
    '+',
    '=',
    '9',
    '8',
    '7',
    
    '6',
    '5',
    '4',
    
    '3',
    '2',
    '1',
    
    '0',
    '.',
    'ANS',
    
  ];

static final List<String> buttonsPotrait = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];



  bool isOperatior(String str) {
    if (['%', '/', 'x', '-', '+', '='].contains(str)) {
      return true;
    }
    return false;
  }

  String calculateResult(String userQuestion) {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    String userAnswer = eval.toString();

    return userAnswer;
  }

  String onPressend({
  required List<String> buttons,
  required String userQuestion,
  required String userAnswer,
  required int index,
}) {
  if (buttons[index] == "C") {
  
    userQuestion = "";

  } else if (buttons[index] == "DEL") {

    userQuestion = userQuestion.substring(
      0,
      userQuestion.length - 1,
    );

  } else {
    
    userQuestion = userQuestion + buttons[index];
    
  }

  return userQuestion;
}

}

