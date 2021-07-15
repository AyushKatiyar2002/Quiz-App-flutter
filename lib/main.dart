import 'package:flutter/material.dart';
import 'bank.dart';
import 'package:rflutter_alert/src/alert.dart';

bank brain = bank();

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[900],
              title: Center(
                child: Text(
                  'Quiz',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.grey[800],
            body: SafeArea(
              child: Padding(padding: EdgeInsets.all(10), child: Quiz()),
            )));
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> score = [];

  void result(String res) {
    setState(() {
      if (brain.finished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        brain.reset();
        score = [];
      } else {
        if (brain.answer() == res) {
          score.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          score.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        brain.nextquestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              brain.question(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: FlatButton(
              child: Text(
                brain.a(),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              color: Colors.blueAccent,
              onPressed: () {
                result(brain.a());
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: FlatButton(
              child: Text(
                brain.b(),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              color: Colors.blueAccent,
              onPressed: () {
                result(brain.b());
              },
            ),
          ),
        ),
        Row(children: score)
      ],
    );
  }
}
