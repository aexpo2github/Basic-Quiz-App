
import 'package:flutter/material.dart';
import 'package:my_app/provider/Score.dart';
import 'answerButton.dart';
import 'score_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> Score()),
  ],
  child: MyApp()));
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue),
      routes: {
        "scoreScreen": (context) => ScoreScreen(null),
        "quizScreen": (context) => CustomWidget(),
      },
      initialRoute: "quizScreen",
      // home: Scaffold(
      //     appBar: AppBar(
      //       title: Text("First app"),
      //     ),
      //     body: CustomWidget()
      // ),
    );
  }
}

class CustomWidget extends StatefulWidget {

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {

  void updateQuestion(String answer){
    if (index == questions.length - 1) {
      if (questions[index]["correctAnswer"] == answer) {
        setState(() {
          context.read<Score>().increment();
        });
      }
      var myScore = context.read<Score>().score;

      context.read<Score>().score = myScore;

      Navigator.pushNamed(context, "scoreScreen");

      setState(() {
        index = 0;
        // context.read<Score>().score = 0;

      });


    }
    else {
      if (questions[index]["correctAnswer"] == answer) {
        setState(() {
          context.read<Score>().increment();
        });
      }
      setState(() {
        index = index + 1;
      });
    }
  }

  var questions = [
    {"questionText": "What is the tallest animal in the world?",
      "answers": ["Elephant", "Giraffe", "Camel"],
      "correctAnswer": "Giraffe"
    },


    { "questionText": "Who is Known as Light of Asia?",
      "answers": ["Jesus Christ", "Lord Shiva", "Gautam Buddha"],
      "correctAnswer": "Gautam Buddha"
    },

    {"questionText": "What is the capital city of Canada?",
      "answers":["Ottawa","Delhi","Washington DC"],
      "correctAnswer":"Ottawa"
    },

    { "questionText": "Which country is known as Land of Temples ",
      "answers":["Bhutan","China","Nepal"],
      "correctAnswer":"Nepal"
    }

  ];

  int index = 0;

  // int score = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz Screen")),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center ,//to place questions and answer in center it is used

        children: [
          Text(questions[index]["questionText"] as String,
            style: TextStyle(fontSize: 20),
          ),

          ...(questions[index]["answers"] as List<String>)
              .map((element) => AnswerButton(element, () => updateQuestion(element)))
              .toList(), //mapping

          Text(
            "Your score : ${context.watch<Score>().score}", //interpolation
            style: TextStyle(fontSize: 20),
          ),

        ],
      ),
    );
  }

}
