import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String bottomTitle;
  BottomButton({required this.onTap, required this.bottomTitle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: onTap as void Function()?,
      child: Container(
        child: Center(child: Text(bottomTitle,style: kLargeButtonTextStyle)),
        color: kBottomContainerColor,
        height: kBottomHeight,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
      ),
    );
  }
}