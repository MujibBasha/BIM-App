import 'package:flutter/material.dart';
import 'package:bmi_app/constants.dart';
import '../component/bottom_button.dart';
import '../component/reusable_card.dart';
class ResultsPage extends StatelessWidget {
  final String resultText;
  final String bmiResult;
  final String interpretation;
  ResultsPage({@required this.bmiResult,@ required this.resultText,@required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Column(
      crossAxisAlignment:CrossAxisAlignment.stretch,
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(

              margin: EdgeInsets.all(10.0),
              child: Text(
                "Your Result",
                style:KTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: ReusableCard(colour:KActiveCardColor,
            cardChild:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(resultText.toUpperCase(),
                  style:KResultTextStyle,
                ),
                Text(bmiResult,
                  style:KBMITextStyle,
                ),
                Text(interpretation,
                  textAlign:TextAlign.center,
                  style: KBodyTextStyle,
                ),
              ],
            ),
            ),

          ),
          Expanded(
            child:BottomButton(onTap:(){
            Navigator.pop(context);
            }
            ,text:"RE-CALCULATE")
          ),
        ],
      ),
    );
  }
}

