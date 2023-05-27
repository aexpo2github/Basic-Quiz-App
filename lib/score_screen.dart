import 'package:flutter/material.dart';
import 'package:my_app/provider/Score.dart';
import 'package:provider/provider.dart';

class ScoreScreen extends StatelessWidget {
  ScoreScreen(this.score);
  int?score;
  @override
  Widget build(BuildContext context) {

    // score = (ModalRoute.of(context)?.settings.arguments
    // as Map<String,dynamic>)["score"];

    return Scaffold(
      appBar:AppBar(
        title: const Text("Score Screen"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your total Score is ${context.watch<Score>().score}",
                style:TextStyle(fontSize: 24),
              ),
              context.watch<Score>().score ==1
                  ? Text("Congratulation you got it",style: TextStyle(fontSize: 24),
              )
              :context.watch<Score>().score ==2
                  ? Text("Congratulation you are doing good",style: TextStyle(fontSize: 24),
              )
                  :context.watch<Score>().score ==3
                  ? Text("Congratulation you are on ur way",style: TextStyle(fontSize: 24),
              )
                  :context.watch<Score>().score == 4
                  ? Text("Congratulation you set high score ",style: TextStyle(fontSize: 24),
              )
                 :SizedBox(
                   height: 0,
                   width:0,
                 ),
      TextButton(
        onPressed: (){
          context.read<Score>().score = 0;
          Navigator.of(context).pop();
          },
        child: Container(
          width:double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Text(
            "Play again",
            style: TextStyle(fontSize:20 ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black87
          ),
        ),
      )

            ],
          )),
    );
  }
}
