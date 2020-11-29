import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../component/icon_content.dart';
import '../component/reusable_card.dart';
import 'package:bmi_app/constants.dart';
import 'results_page.dart';
import '../component/bottom_button.dart';
import '../component/round_icon_button.dart';
import 'package:bmi_app/calculator_brain.dart';

enum Gender {
  male,
  fmale
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 70;
  int age = 25;
  //Color maleCardColour=inActiveCardColor;
  //Color fmaleCardColour=inActiveCardColor;
  // 1 = male , 2 = fmale
  // void updateColour (Gender gender) {
  //   if(gender == Gender.male )
  //     {
  //       if(maleCardColour == inActiveCardColor )
  //         {
  //         maleCardColour=activeCardColor;
  //         fmaleCardColour=inActiveCardColor;
  //         }
  //       else{
  //         maleCardColour=inActiveCardColor;
  //       }
  //
  //     }
  //   else if(gender == Gender.fmale)
  //     {
  //       if(fmaleCardColour == inActiveCardColor )
  //       {
  //         fmaleCardColour=activeCardColor;
  //         maleCardColour=inActiveCardColor;
  //       }
  //       else{
  //         fmaleCardColour=inActiveCardColor;
  //       }
  //     }
  // }
  // ## ==> Example how to use this before update to few Line of code ##
  // Expanded(
  // child: GestureDetector(
  // onTap:(){
  // setState(() {
  // updateColour(Gender.male);
  // });
  // },
  // child: ReusableCard(
  // colour: maleCardColour,
  // cardChild: IconsContent(label:"MALE",icon:FontAwesomeIcons.mars),
  // ),
  // ),
  // ),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("BMI calculator"),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? KActiveCardColor
                      : KInActiveCardColor,
                  cardChild:
                      IconsContent(label: "MALE", icon: FontAwesomeIcons.mars),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.fmale;
                    });
                  },
                  colour: selectedGender == Gender.fmale
                      ? KActiveCardColor
                      : KInActiveCardColor,
                  cardChild:
                      IconsContent(label: "FMALE", icon: FontAwesomeIcons.venus),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            colour: KActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: KLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: KNumberTextStyle,
                    ),
                    Text(
                      "CM",
                      style: KLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0XFF8D8E98),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
                    thumbColor: Color(0xFFEB1555),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    overlayColor: Color(0x29EB1555),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
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
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: KActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: KLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: KNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: KActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: KLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: KNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }),
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
            onTap:() {

              CalculatorBrain cal=CalculatorBrain(height: height,weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(bmiResult: cal.calculatorBMI(),

                    resultText:cal.getResult(),
                    interpretation: cal.getInterpretation(),
                  ),
                ),
              );
            },
          text:"CALCULATE",

        ),
      ]),
    );
  }
}
