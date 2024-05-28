import 'package:flutter/material.dart';

import 'bottom_Button.dart';
import 'constants.dart';
import 'reuseable_widget.dart';

class Result extends StatelessWidget {

  Result({required this.bmiResult,required this.interpretation,required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: ReusableWidget(
                  colour: kInActiveColor,
                  childCard: Padding(
                    padding: EdgeInsets.only(top: 80, bottom: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Center(
                            child: Text(
                          resultText.toUpperCase(),
                          style: kTopTitle,
                        )),
                        Center(
                            child: Text(
                          bmiResult,
                          style: kBMI,
                        )),
                        Center(
                            child: Text(
                          interpretation,
                          style: kBottomTitle,
                          textAlign: TextAlign.center,
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              bottomTitle: 'RE-CALCULATE ',
            )
          ],
        ),
      ),
    );
  }
}
