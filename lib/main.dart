import 'package:calculate_app/functions/money_format.dart';
import 'package:flutter/material.dart';

import 'custom_widget/cal_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userInput = '';
  var answer = '';

  final List<String> calculateBot = [
    '÷',
    '9',
    '8',
    '7',
    '×',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '=',
    '0',
    '.',
  ];


  var firstNum = '';
  bool isItNewOp = true;
  var theOpr = ' ';
  var theOpr2 = ' ';
  var result = '0';
  var theTrans = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*.15,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height:MediaQuery.of(context).size.height * .06,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Center(
                        child: Container(
                          color: Colors.grey.withOpacity(0.3),
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Text(
                              theTrans,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (result.contains('1') ||
                                  result.contains('2') ||
                                  result.contains('3') ||
                                  result.contains('4') ||
                                  result.contains('5') ||
                                  result.contains('6') ||
                                  result.contains('7') ||
                                  result.contains('8') ||
                                  result.contains('9') ||
                                  result.contains('.')) {
                                if ((result != '0') && (result.length > 1)) {
                                  result =
                                      result.substring(0, result.length - 1);
                                } else if (result.length == 1) {
                                  result = '0';
                                }
                              } else {
                                result = '0';
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.backspace,
                            color: Colors.black,
                          )),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: SizedBox(
                          // color: Colors.grey,
                          width: MediaQuery.of(context).size.width * .7,
                          height: MediaQuery.of(context).size.height * .06,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Center(
                                child: Text(
                                  '${writeMoneyFormatSetWithComma(result)}',
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * .055,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .55,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: GridView.builder(
                  itemCount: calculateBot.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    // Clear Button
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: calButton(
                        context: context,
                         buttonTapped: (){
                           setState(() {

                             if (calculateBot[index] == '+' ||
                                 calculateBot[index] == '-' ||
                                 calculateBot[index] == '×' ||
                                 calculateBot[index] == '÷' ||
                                 calculateBot[index] == '=') {
                               if(result != 'No result') {
                                 if (isItNewOp) {
                                   isItNewOp = false;
                                   if (theOpr == '=') {
                                     theTrans = result;
                                   }

                                   if (theOpr == ' ') {
                                     firstNum = result;
                                     theTrans += firstNum;
                                   } else {
                                     // theTrans= theTrans + result;
                                     var x = result;
                                     if (theOpr == '+') {
                                       firstNum =
                                           (double.parse(firstNum) +
                                               double.parse(x))
                                               .toString();
                                       theTrans += ' + ';
                                       theTrans += x;
                                     }

                                     if (theOpr == '-') {
                                       firstNum =
                                           (double.parse(firstNum) -
                                               double.parse(x))
                                               .toString();
                                       theTrans += ' - ';
                                       theTrans += x;
                                     }

                                     if (theOpr == '×') {
                                       firstNum =
                                           (double.parse(firstNum) *
                                               double.parse(x))
                                               .toString();
                                       theTrans += ' × ';
                                       theTrans += x;
                                     }

                                     if (theOpr == '÷') {
                                       if (double.parse(firstNum) <
                                           double.parse(x) ||
                                           firstNum == '0') {
                                         result = 'Error';
                                       } else {
                                         firstNum = (double.parse(firstNum) /
                                             double.parse(x))
                                             .toString();
                                         theTrans += ' ÷ ';
                                         theTrans += x;
                                       }
                                     }

                                     if (theOpr == '=') {
                                       if (theOpr == '+') {
                                         firstNum = (double.parse(firstNum) +
                                             double.parse(x))
                                             .toString();
                                         theTrans = result;
                                       }

                                       if (theOpr == '-') {
                                         firstNum = (double.parse(firstNum) -
                                             double.parse(x))
                                             .toString();
                                         theTrans = result;
                                       }

                                       if (theOpr == '×') {
                                         firstNum = (double.parse(firstNum) *
                                             double.parse(x))
                                             .toString();
                                         theTrans = result;
                                       }

                                       if (theOpr == '÷') {
                                         if (double.parse(firstNum) <
                                             double.parse(x) ||
                                             firstNum == '0') {
                                           result =
                                           'Error';
                                         } else {
                                           firstNum = (double.parse(firstNum) /
                                               double.parse(x))
                                               .toString();
                                           theTrans = result;
                                         }
                                       }
                                     }
                                   }

                                   result = firstNum;
                                 }
                                 theOpr = calculateBot[index];
                                 theOpr2 = calculateBot[index];
                               }
                             }
                             else {
                               if(result == 'No result'){
                                 result='';
                               }
                               theOpr2 = ' ';
                               if (isItNewOp == false) {
                                 result = '';
                               }
                               if (theOpr == '=') {
                                 firstNum = '';
                                 theOpr = ' ';
                                 theTrans = '';
                               }
                               if (result == '0') {
                                 result = '';
                               }
                               if (calculateBot[index] == '.') {
                                 var numberOfDot = 0;
                                 for (var i = 0; i < result.length; i++) {
                                   if (result[i] == '.') {
                                     numberOfDot++;
                                   }
                                 }
                                 if (numberOfDot == 0) {
                                   result += calculateBot[index];
                                 }
                               } else {
                                 result += calculateBot[index];
                               }
                               isItNewOp = true;
                             }
                           });
                         },
                         color:Colors.white ,
                        botTxt:calculateBot[index],
                        theOpr2: theOpr2 , ),
                    );
                  }),
            ),
          ),
          Center(
            child: TextButton(onPressed: (){
              setState(() {
                firstNum = '';
                isItNewOp = true;
                theOpr = ' ';
                theOpr2 = ' ';
                result = '0';
                theTrans = '';
              });
            }, child: Text(
              'AC',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * .08,
                  color: Theme.of(context).primaryColor),
            ),),
          )
        ],
      ),
    );
  }
}
