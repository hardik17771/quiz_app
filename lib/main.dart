import 'dart:ffi';

import 'package:flutter/material.dart';
import 'question.dart';
import 'harddd.dart';
Harddd quizzu = Harddd() ;

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black38,
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

  List<Icon> score = [];

  void checkAnswer(bool userans) {
    bool correc = quizzu.getQuestionAns();
    setState(() {
      if (userans == correc) {
        score.add(Icon(Icons.check,
          color: Colors.green,),);
      }
      else {
        score.add(Icon(Icons.not_interested,
          color: Colors.red,),);
      }

    });
  }

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

                  quizzu.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 30.0,
                    color: Colors.lightBlueAccent,
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
                    fontFamily: 'Cormo',
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  checkAnswer(true);
                  setState(() {
                    quizzu.nextQuestion();
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
                    fontFamily: 'Cormo',
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkAnswer(false);
                  setState(() {
                    quizzu.nextQuestion();
                  });
                  //The user picked false.
                },
              ),
            ),
          ),
          Row(
            children: score,
          )
        ],
      );
    }
}
