import 'package:flutter/material.dart';
import 'package:bmi_app/constants.dart';
class BottomButton extends StatelessWidget {
final Function onTap;
final String text;
BottomButton({@required  this.onTap,@required this.text});
@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.only(bottom: 4),
      color: KBottomContainerColor,
      margin: EdgeInsets.only(top: 3.0),
      width: double.infinity,
      height: KBottomContainerHeight,
      child: Center(
        child: Text(
          text,
          style: KLargeButtonTextStyle,
        ),
      ),
    ),
  );
}
}