import 'package:bmi_calculator_project/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bmi_calculator_project/bottom_button.dart';

class PageResult extends StatelessWidget {
  final String bmiNumber;
  final String bmiTitleResult;
  final String bmiResultDescription;

  PageResult(
      {required this.bmiNumber,
      required this.bmiTitleResult,
      required this.bmiResultDescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Your Result',
                    style: kTitlePageResult,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(bmiTitleResult.toUpperCase(), style: kTitleCardResult),
                  Text(bmiNumber, style: kScorePageResult),
                  Text(
                    bmiResultDescription,
                    style: kDescriptionPageResult,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonText: 're-calculate my bmi',
            style: kTextStyleButton,
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
