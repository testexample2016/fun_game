import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  final List<String> rightAnswer;
  // final List<String> rightList;

  Result(this.resultScore, this.resetHandler, this.rightAnswer);

  String get resultPhrase {
    String resultText;
    if (resultScore == 5) {
      resultText = 'সব ঠিক আছে!';
    } else if (resultScore == 4) {
      resultText = '৪ টি ঠিক!\n' + rightAnswer.toString();
    } else if (resultScore == 3) {
      resultText = '৩ টি ঠিক!\n' + rightAnswer.toString();
    } else if (resultScore == 2) {
      resultText = '২ টি ঠিক!\n' + rightAnswer.toString();
    } else if (resultScore == 1) {
      resultText = '১ টি ঠিক!\n' + rightAnswer.toString();
    } else {
      resultText = 'আবার চেষ্টা করুন!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text(
            'Reset Quiz!',
          ),
          textColor: Colors.blue,
          onPressed: resetHandler,
        )
      ],
    ));
  }
}
