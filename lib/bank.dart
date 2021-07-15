import 'question.dart';
import 'options.dart';
class bank{
  List<Question> _questionBank=[
    Question(q:'Is my name Ayush?',a:'Yes'),
    Question(q:' I am currently in which year of B tech?',a:'3rd'),
    Question(q:'Is Demon Slayer good?',a:'Very Good')
  ];
  int _number=0;
  List<options> _opt=[
    options(a:'Yes',b:'No' ),
    options(a:'2nd',b:'3rd'),
    options(a:'Good',b:'Very Good'),
  ];
  String question()
  {
    return _questionBank[_number].que;
  }
  String answer()
  {
    return _questionBank[_number].ans;

  }
  void nextquestion()
  {
    if(_number<_questionBank.length-1)
      _number++;

  }
  String a()
  {
    return _opt[_number].a;

  }
  String b()
  {
    return _opt[_number].b;

  }
  bool finished()
  {
    if(_number>=_questionBank.length-1) {
      print(true);
      return true;

    }
    else {
      print(false);
      return false;

    }}
  void reset()
  {
    _number=0;
  }



}