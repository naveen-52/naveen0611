import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double size = 0;
  String outputvalue = "";
  String inputvalue = "";
  String operator = "";

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 5;
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                inputvalue,
                style: TextStyle(color: Colors.black, fontSize: 100),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    buildcircle("7", const Color.fromARGB(255, 255, 255, 255)),
                    buildcircle("8", const Color.fromARGB(255, 255, 255, 255)),
                    buildcircle("9", const Color.fromARGB(255, 255, 255, 255)),
                    buildcircle("/", const Color.fromARGB(255, 255, 255, 255)),
                  ],
                ),
                Row(
                  children: [
                    buildcircle("4", const Color.fromARGB(255, 255, 255, 255)),
                    buildcircle("5", const Color.fromARGB(255, 255, 255, 255)),
                    buildcircle("6", const Color.fromARGB(255, 255, 255, 255)),
                    buildcircle("*", const Color.fromARGB(255, 255, 255, 255)),
                  ],
                ),
                Row(
                  children: [
                    buildcircle("1", const Color.fromARGB(255, 255, 255, 255)),
                    buildcircle("2", const Color.fromARGB(255, 255, 255, 255)),
                    buildcircle("3", const Color.fromARGB(255, 255, 255, 255)),
                    buildcircle("-", const Color.fromARGB(255, 255, 255, 255)),
                  ],
                ),
                Row(
                  children: [
                    buildcircle("0", const Color.fromARGB(255, 255, 255, 255)),
                    buildcircle(".", const Color.fromARGB(255, 255, 255, 255)),
                    buildcircle("=", const Color.fromARGB(255, 255, 255, 255)),
                    buildcircle("+", const Color.fromARGB(255, 255, 255, 255)),
                  ],
                ),
                buildcircle("clear", const Color.fromARGB(255, 255, 255, 255)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildcircle(String number, Color bgColor) {
    return InkWell(
      onTap: () {
        if (number == "clear") {
          setState(() {
            inputvalue = "";
            outputvalue = "";
            operator = "";
          });
        } else if (number == "=") {
          setState(() {
            double num1 = double.parse(outputvalue);
            double num2 = double.parse(inputvalue);
            if (operator == "+") {
              inputvalue = (num1 + num2).toString();
            } else if (operator == "-") {
              inputvalue = (num1 - num2).toString();
            } else if (operator == "*") {
              inputvalue = (num1 * num2).toString();
            } else if (operator == "/") {
              inputvalue = (num1 / num2).toString();
            }
          });
        }
        else if (number == "+" ||
            number == "-" ||
            number == "*" ||
            number == "/") {
          setState(() {
            outputvalue = inputvalue;
            inputvalue = "";
            operator = number;
          });
        } else {
          setState(() {
            inputvalue += number;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.all(8),
        height: size,
        width: size,
        alignment: Alignment.center,
        child: Text(
          number,
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
    );
  }
}
