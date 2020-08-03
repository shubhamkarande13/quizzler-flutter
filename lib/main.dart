import 'package:flutter/material.dart';
import 'question.dart';
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List <Icon>scoreKeeper = [
    Icon(
      Icons.check,
      color:Colors.green,
    ),
    Icon(
      Icons.close,
      color:Colors.red,
    )
  ];
  List<Question> questionBank = [
  Question(q:'You can lead a cow down stairs but not up stairs.',  a:false),
  Question(q: 'Approximately one quarter of human bones are in the feet.', a:true),
  Question(q:'A slug\'s blood is green.',  a:true),
  Question(q:'The pattern on every person\'s tongue is as unique as a fingerprint',  a:true),
  Question(q:'A group of crows is called murder.',  a:true),
  Question(q:'Tomato sauce was sold in the 1800\'s as medicine.',  a:true),
  Question(q:'In France, there’s a place called Y.',  a:true),
  Question(q:'Half of all bank robberies take place on a Friday.',  a:true),
  Question(q:'Cheetahs are so shy that zoos have to give them support dogs.',  a:true),
  Question(q:'The Number of People Travelling in the Indian Railways Every Day is Equal to the Population of Australia.',  a:true),
  ];


  int questionNumber=0;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer=questionBank[questionNumber].questionAnswer;
                if (correctAnswer==true){
                  print('right answer');
                }
                else {print('wrong answer');
                }
                setState(() {
                  questionNumber++;
                });
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  questionNumber++;
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
