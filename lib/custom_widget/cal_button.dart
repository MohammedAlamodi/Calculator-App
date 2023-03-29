import 'package:flutter/material.dart';

calButton({required BuildContext context,
  buttonTapped,
  required Color color,
  required String botTxt,
  required String theOpr2}) {
  // ignore: deprecated_member_use
  return MaterialButton(
      elevation: 20,
      // height: scrHeight(context)*.1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      onPressed: buttonTapped,
      color: (botTxt == '+' && theOpr2 == '+')
          ? Colors.black54
          : (botTxt == '÷' && theOpr2 == '÷')
          ? Colors.black54
          : (botTxt == '×' && theOpr2 == '×')
          ? Colors.black54
          : (botTxt == '-' && theOpr2 == '-')
          ? Colors.black54
          : (botTxt == '÷' ||
          botTxt == '×' ||
          botTxt == '+' ||
          botTxt == '-')
          ? Colors.orangeAccent
          : (botTxt == '=' || botTxt == '.')
          ? Colors.grey[350]
          : color,
      child: Text(
        botTxt,
        style: TextStyle(
            color: (botTxt == '÷' ||
                botTxt == '×' ||
                botTxt == '+' ||
                botTxt == '-')
                ? Colors.white
                : Colors.black,
            fontSize: MediaQuery.of(context).size.width * .05),
      ));
}