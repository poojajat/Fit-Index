import 'package:bmi_calculator/calculateBrain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'reuseable_widget.dart';
import 'result.dart';
import 'bottom_Button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 173;
  int weight = 50;
  int age=19;

  // Color maleCardColor = inActiveColor;
  // Color femaleCardColor = inActiveColor;
  //
  // void upDate(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (maleCardColor == inActiveColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inActiveColor;
  //     } else
  //       maleCardColor = inActiveColor;
  //   }
  //   if (gender == Gender.female) {
  //     if (femaleCardColor == inActiveColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inActiveColor;
  //     } else
  //       femaleCardColor = inActiveColor;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'BMI Calculator',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableWidget(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInActiveColor,
                      childCard: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',
                      )),
                ),
                Expanded(
                  child: ReusableWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInActiveColor,
                    childCard: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableWidget(
              colour: kActiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kBigTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableWidget(
                      colour: kActiveCardColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kBigTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                shape: CircleBorder(),
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 13),
                                  child:
                                      Icon(Icons.minimize, color: Colors.white),
                                ),
                                backgroundColor: kInActiveColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                shape: CircleBorder(),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                backgroundColor: kInActiveColor,
                              ),
                            ],
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableWidget(
                      colour: kActiveCardColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kBigTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                shape: CircleBorder(),
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 13),
                                  child:
                                      Icon(Icons.minimize, color: Colors.white),
                                ),
                                backgroundColor: kInActiveColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                shape: CircleBorder(),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                backgroundColor: kInActiveColor,
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          BottomButton(onTap: (){
            CalculatorBrain calc=CalculatorBrain(height: height,weight: weight);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Result(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult() ,
                  interpretation:calc.getInterpretation() ,

                ),
              ),
            );
          },
          bottomTitle: 'CALCULATE YOUR BMI',)
        ],
      ),
    );
  }
}

