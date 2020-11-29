import 'package:flutter/material.dart';
import 'screens/input_page.dart';
void main() {
  runApp(BMICalculetor());
}

class BMICalculetor extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor:Color(0XFF0A0E21),
        scaffoldBackgroundColor:Color(0XFF0A0E21),


        // sliderTheme:SliderTheme.of(context).copyWith(
        //   activeTrackColor: Colors.white,
        //   inactiveTrackColor: Color(0XFF8D8E98),
        //   thumbShape: RoundSliderThumbShape(enabledThumbRadius:16.0),
        //   thumbColor: Color(0xFFEB1555),
        //   overlayShape: RoundSliderOverlayShape(overlayRadius:30),
        //   overlayColor:Color(0x29EB1555),
        // ),
      ),
      home:InputPage(),
    );
  }
}


