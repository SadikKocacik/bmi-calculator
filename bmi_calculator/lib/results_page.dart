import 'package:flutter/material.dart';
import 'constans.dart';
import 'reusable_card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.bmiResult,
      required this.interpretation,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text('BMI HESAPLAYICI'),
        ),
        backgroundColor: Color(0XFF16193D),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'BMI Değeri',
                    style: kTitleTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            flex: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                  child: Text(
                'YENİDEN HESAPLA',
                style: kLargeButtonStyle,
              )),
              color: kBottomContainerColor,
              width: double.infinity,
              height: kBottomContainerHeight,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(bottom: 10),
            ),
          ),
        ],
      ),
    );
  }
}
