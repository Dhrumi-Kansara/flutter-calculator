import 'package:flutter/material.dart';
import './button.dart';
import './model/calculator.dart';

class BuildPotrait extends StatefulWidget {
  const BuildPotrait({Key? key}) : super(key: key);

  @override
  State<BuildPotrait> createState() => _BuildPotraitState();
}

class _BuildPotraitState extends State<BuildPotrait> {
  Calculator cal = Calculator();

  String userQuestion = '';
  String userAnswer = '';

  final List<String> buttons = Calculator.buttonsPotrait;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /* input section */
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    userQuestion,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userAnswer,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          /* button section */
          flex: 2,
          child: GridView.builder(
            itemCount: buttons.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (BuildContext context, int index) {
              Color? btnColor = Colors.deepPurple[50];
              Color textColor = Colors.deepPurple;

              if (buttons[index] == "C") {
                btnColor = Colors.green;
                textColor = Colors.white;
              } else if (buttons[index] == "DEL") {
                btnColor = Colors.red;
                textColor = Colors.white;
              } else if (cal.isOperatior(buttons[index])) {
                btnColor = Colors.deepPurple;
                textColor = Colors.white;
              }

              return MyButton(
                  color: btnColor!,
                  textColor: textColor,
                  buttonText: buttons[index],
                  buttonTapped: () {
                    if (["ANS", '='].contains(buttons[index])) {
                      String answer = cal.calculateResult(userQuestion);
                      setState(() {
                        userAnswer = answer;
                      });
                    } else {
                      if (buttons[index] == 'C') {
                        setState(() {
                          userAnswer = "";
                        });
                      }
                      String question = cal.onPressend(
                          index: index,
                          buttons: buttons,
                          userAnswer: userAnswer,
                          userQuestion: userQuestion);
                      setState(() {
                        userQuestion = question;
                      });
                    }
                  });
            },
          ),
        ),
      ],
    );
  }
}
