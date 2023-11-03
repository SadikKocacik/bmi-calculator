import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'constans.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

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
  Color maleCardColour = kInactiveCardColor;
  Color femaleCardColour = kInactiveCardColor;
  int height = 170;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI HESAPLAYICI')),
        backgroundColor: Color(0XFF16193D),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                cardChild: IconContent(
                  ican: FontAwesomeIcons.mars,
                  yazi: 'ERKEK',
                ),
                colour: selectedGender == Gender.male
                    ? kActiveCardColor
                    : kInactiveCardColor,
                ontap: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
              )),
              Expanded(
                  child: ReusableCard(
                colour: selectedGender == Gender.female
                    ? kActiveCardColor
                    : kInactiveCardColor,
                ontap: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                cardChild: IconContent(
                  ican: FontAwesomeIcons.venus,
                  yazi: 'KADIN',
                ),
              )),
            ],
          )),
          Expanded(
              child: ReusableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BOY',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kWeightTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                        print(newValue);
                      });
                    },
                    min: 120,
                    max: 220,
                    activeColor: Colors.white,
                    inactiveColor: Color(0xFF8D8E98),
                    thumbColor: const Color(0xFFEB1555),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'KİLO',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kWeightTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            updatedata: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            updatedata: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ]),
              )),
              Expanded(
                  child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'YAŞ',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kWeightTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            updatedata: () {
                              setState(() {
                                if (age >= 1) {
                                  age--;
                                }
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            updatedata: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ]),
              )),
            ],
          )),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => ResultPage(
                          bmiResult: calc.calculateBMI(),
                          interpretation: calc.getInterpretation(),
                          resultText: calc.getResult()))));
            },
            child: Container(
              child: Center(
                  child: Text(
                'HESAPLA',
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

class RoundIconButton extends StatelessWidget {
  RoundIconButton({super.key, this.icon, this.updatedata});
  final IconData? icon;
  final VoidCallback? updatedata;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: updatedata,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
