import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton(this.answerText,this.handlePress);

  Function()handlePress;
  String? answerText ;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: handlePress,
      child: Container(
        width:double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Text(
          answerText!,
          style: TextStyle(fontSize:20 ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black87
        ),
      ),
    );
  }
}
