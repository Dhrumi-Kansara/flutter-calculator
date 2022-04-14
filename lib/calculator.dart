import 'package:flutter/material.dart';
import './button.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userQuestion = '1+2*2';
  String userAnswer = '5';

  final List<String> buttons = [
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

  void onClear() {
    setState(() {
      userQuestion="";
    });
  }

    void onDelete() {
    setState(() {
      userQuestion=userQuestion.substring(0, userQuestion.length-1);
    });
  }

  void onAdd(String str) {
    setState(() {
      userQuestion=userQuestion+str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: Column(
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

                  } else if (isOperatior(buttons[index])) {

                    btnColor = Colors.deepPurple;
                    textColor = Colors.white;

                  }

                  return MyButton( 
                    color: btnColor!,
                    textColor: textColor,
                    buttonText: buttons[index],
                    buttonTapped: (){},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
