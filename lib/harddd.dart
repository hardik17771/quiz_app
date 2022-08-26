import 'dart:ffi';
import 'main.dart';
import 'question.dart';
class Harddd {
  int quenumber=0;
  List<Questions> _questt =
  [ Questions(q:'Is Pondi related to Porn?',a: true),
    Questions(q: 'Does Maanas have feelings for Komal?', a: true),
    Questions(q:'Is Chaitanya Kohli our best friend', a: false),
    Questions(q: 'Will I die virgin?', a: false),
    Questions(q: 'Does Shantun love only one girl?', a: false),
    Questions(q: 'We all love Brij Kishor?', a: true),
    Questions(q: 'Bharti Mam mast marks deti?', a: true),
    Questions(q: 'Das Bhanane krke le gye dil?', a: false),

  ];
      void nextQuestion(){
        if(quenumber<_questt.length-1)
          {
            quenumber++;
          }
      }
      String getQuestionText()
      {
        return _questt[quenumber].questext;
      }
      bool getQuestionAns()
      {
        return _questt[quenumber].quesans;
      }
}