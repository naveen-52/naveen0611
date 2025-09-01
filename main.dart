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
 double  size = 0;
 String inputValue="";
 String calculatorvalue="";
 String operat="";
  @override
  Widget build(BuildContext context) {
   size=MediaQuery.of(context).size.width/5;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        body: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child:Text(inputValue,style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),fontSize:100),)
            ),
            Column(
              children: [
                Row(
                  children: [
                    calbutton("7",Colors.white),
                     calbutton("8",Colors.white),
                      calbutton("9",Colors.white),
                       calbutton("/",const Color.fromARGB(255, 255, 94, 45)),
                       ],
                    ),
                     Row(
                  children: [
                    calbutton("4",Colors.white),
                     calbutton("5",Colors.white),
                      calbutton("6",Colors.white),
                       calbutton("*",const Color.fromARGB(255, 255, 94, 45)),
                       ],
                    ),
                     Row(
                  children: [
                    calbutton("1",Colors.white),
                     calbutton("2",Colors.white),
                      calbutton("3",Colors.white),
                       calbutton("-",const Color.fromARGB(255, 255, 94, 45)),
                       ],
                    ),
                     Row(
                  children: [
                    calbutton("0",Colors.white),
                     calbutton(".",Colors.white),
                      calbutton("=",Colors.white),
                       calbutton("+",const Color.fromARGB(255, 255, 94, 45)),
                       ],
                    ),
                  ],
                ),
                calbutton("clear", const Color.fromARGB(255, 255, 255, 255)),
              ],
            ),
        ),
      );
  }

Widget calbutton(String text,Color bgColor)
{
  return InkWell(
    onTap: () {
      if(text=="clear")
      {
setState(() {
  inputValue="";
  calculatorvalue="";
  operat="";
});
      }
      else if(text=="="){
        setState(() {
          double calc=double.parse(calculatorvalue);
          double input=double.parse(inputValue);
          //inputValue=calculatorvalue+inputValue;
         if(operat=="+")
         {
          inputValue=(calc+input).toString();
         }
         else if(operat=="-")
         {
          inputValue=(calc-input).toString();
         }
         else if(operat=="*")
         {
          inputValue=(calc*input).toString();
         }
         else if(operat=="/")
         {
          inputValue=(calc/input).toString();
         }
        });
      }
      else if(text=="+"||text=="-"||text=="*"||text=="/")
      {
       setState(() {
          calculatorvalue=inputValue;
          inputValue="";
          operat=text;
       });
      }
      else{
setState(() {
        inputValue=inputValue+text;//concatenate panna use aguthu
      });
      }
      
    },
    child: Container(
                        decoration: BoxDecoration(
                          color:bgColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        margin: EdgeInsets.all(8.5),
                        width: size,
                        height: size,
                        alignment: Alignment.center,
                        child:  Text(text,style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 30))
                      ),
  );
}
}