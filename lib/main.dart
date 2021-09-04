import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'ভারতে বিশ্বের সবচেয়ে বড় আমানত রয়েছে ?',
      'answers': [
        {'text': 'স্বর্ণ', 'score': 0},
        {'text': 'তামা', 'score': 0},
        {'text': 'মাইকা', 'score': 1},
        {'text': 'লোহা', 'score': 0},
      ],
    },
    {
      'questionText': 'লোকসভার কতটি আসন পশ্চিমবঙ্গের অন্তর্গত?',
      'answers': [
        {'text': '৩২', 'score': 0},
        {'text': '২৫', 'score': 0},
        {'text': '৪২', 'score': 1},
        {'text': '১৭', 'score': 0},
      ],
    },
    {
      'questionText': 'ভারতে সবচেয়ে বেশি বনভূমি রয়েছে এমন রাজ্য?',
      'answers': [
        {'text': 'অরুণাচল প্রদেশ', 'score': 0},
        {'text': 'হরিয়ানা', 'score': 0},
        {'text': 'মধ্য প্রদেশ', 'score': 1},
        {'text': 'আসাম', 'score': 0},
      ],
    },
    {
      'questionText': 'বিখ্যাত বই \'আনন্দমঠ\' রচনা করেছিলেন?',
      'answers': [
        {'text': 'সরোজিনী নাইডু', 'score': 0},
        {'text': 'বঙ্কিমচন্দ্র চট্টপাধ্যায়', 'score': 1},
        {'text': 'শ্রী অরবিন্দ', 'score': 0},
        {'text': 'রবীন্দ্রনাথ ঠাকুর', 'score': 0},
      ],
    },
    {
      'questionText': '\'ডান্ডিয়া\' একটি জনপ্রিয় নৃত্য?',
      'answers': [
        {'text': 'পাঞ্জাব', 'score': 0},
        {'text': 'গুজরাট', 'score': 1},
        {'text': 'তামিলনাড়ু', 'score': 0},
        {'text': 'মহারাষ্ট্র', 'score': 0},
      ],
    },
  ];
  var _questionIndex = 0;

  var _totalScore = 0;

  var _rightAnswer = ['vul', 'vul', 'vul', 'vul', 'vul'];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    if (score == 1) {
      _rightAnswer[_questionIndex] = 'ঠিক';
    } else {
      _rightAnswer[_questionIndex] = 'ভুল';
    }

    print(_rightAnswer);

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

//  print(_questions[_questionIndex]);
    // print(_questionIndex);
    // print(_rightAnswer);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Question & Answer'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz, _rightAnswer),
      ),
    );
  }
}
