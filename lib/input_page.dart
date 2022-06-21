import 'package:bmi_calculator_project/page_result.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_project/reusable_card.dart';
import 'package:bmi_calculator_project/reusable_card_content.dart';
import 'package:bmi_calculator_project/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_project/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  void activateGender(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  int height = 180;
  int weight = 60;
  int age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI Calculator'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () => activateGender(Gender.male),
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusableCardContent(
                      iconContent: kIconMars,
                      textContent: 'male'.toUpperCase(),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () => activateGender(Gender.female),
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusableCardContent(
                      iconContent: kIconVenus,
                      textContent: 'female'.toUpperCase(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'height'.toUpperCase(),
                          style: kTextStyleCard,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              '$height',
                              style: kTextStyleHeight,
                            ),
                            Text(
                              'cm',
                              style: kTextStyleCard,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: kBottomContainerColor,
                            overlayColor: Color(0x29EB1555),
                            activeTrackColor: kBottomContainerColor,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            trackHeight: 1.5,
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 0.0,
                            max: 230.0,
                            onChanged: (double newValue) {
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
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'weight'.toUpperCase(),
                          style: kTextStyleCard,
                        ),
                        Text(
                          '$weight',
                          style: kTextStyleHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
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
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'age'.toUpperCase(),
                          style: kTextStyleCard,
                        ),
                        Text(
                          '$age',
                          style: kTextStyleHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
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
          Container(
            width: double.infinity,
            height: kBottomContainerHeight,
            decoration: BoxDecoration(
              color: kBottomContainerColor,
            ),
            child: TextButton(
              onPressed: () {
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                Navigator.push(context,
                MaterialPageRoute(builder: (context) => PageResult(
                  bmiNumber: calc.calculateBMI(),
                  bmiTitleResult: calc.getTitleResult(),
                    bmiResultDescription: calc.getResultDescription()
                )));
              },
              child: Text(
                'calculate my bmi'.toUpperCase(),
                style: kTextStyleButton,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Implementing our own button instead of using the default Floating Action Button.

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;

  RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
    );
  }
}
