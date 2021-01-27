import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/reusable_card.dart';
import 'package:bmi_calculator/screens/round_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/result_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender{
  male,
  female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender gender;
  int height = 180;
  int weight = 45;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    colour: gender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                    cardChild: IconContent(iconData: FontAwesomeIcons.mars,label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    colour: gender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                    cardChild: IconContent(iconData: FontAwesomeIcons.venus,label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT',
                      style: kLabelStyle,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text('cm',
                          style: kLabelStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: kThumbSliderColor,
                        activeTrackColor: kActiveSliderColor,
                        inactiveTrackColor: kInactiveSliderColor,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 13.0,
                          elevation: 8.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 25.0
                        ),
                        overlayColor: kOverlaySliderColor,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: kMinHeight,
                        max: kMaxHeight,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT',
                        style: kLabelStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            SizedBox(
                              width: 3.0,
                            ),
                            Text('kg',
                              style: kLabelStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',
                            style: kLabelStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(age.toString(),
                              style: kNumberTextStyle,
                            ),
                            SizedBox(
                              width: 3.0,
                            ),
                            Text('years',
                              style: kLabelStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap:(){
              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )));
              },
          ),
        ],
      ),
    );
  }
}

