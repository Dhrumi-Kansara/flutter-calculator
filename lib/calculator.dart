import 'package:flutter/material.dart';
import './button.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',

    '9',
    '8',
    '7',
    'X',

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(child: Container()),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (BuildContext context, int index) {

                Color? btnColor = Colors.deepPurple[50];
                Color textColor = Colors.deepPurple; 

                if(buttons[index]=="C") {

                btnColor=Colors.green;
                textColor=Colors.white; 

                } 
                else if(buttons[index]=="DEL") {

                  btnColor=Colors.red;
                  textColor=Colors.white; 

                }
                else if(isOperatior(buttons[index])) {

                  btnColor=Colors.deepPurple;
                  textColor=Colors.white; 

                }
                else {

                }

                return MyButton(
                  color: btnColor!,
                  textColor: textColor,
                  buttonText: buttons[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
