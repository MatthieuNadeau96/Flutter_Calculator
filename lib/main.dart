import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
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
          Container(
            height: MediaQuery.of(context).size.height * 0.70,
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                // Clear Button
                if (index == 0) {
                  return MyButton(
                    buttonText: buttons[index],
                    color: Colors.green[300],
                    textColor: Colors.white,
                    buttonTapped: () {
                      setState(() {
                        userQuestion = '';
                      });
                    },
                  );
                  // Delete Button
                } else if (index == 1) {
                  return MyButton(
                    buttonText: buttons[index],
                    color: Colors.red[300],
                    textColor: Colors.white,
                    buttonTapped: () {
                      setState(() {
                        userQuestion =
                            userQuestion.substring(0, userQuestion.length - 1);
                      });
                    },
                  );
                  // Rest of the buttons
                } else {
                  return MyButton(
                    buttonTapped: () {
                      setState(() {
                        userQuestion += buttons[index];
                      });
                    },
                    buttonText: buttons[index],
                    color: isOperator(buttons[index])
                        ? Colors.deepPurple[400]
                        : Colors.deepPurple[300],
                    textColor: Colors.white,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
}
