import 'package:flutter/material.dart';
class ReusableWidget extends StatelessWidget {
  final Color colour;
  final Widget? childCard;
  final Function onPress;

  ReusableWidget({required this.colour, this.childCard, this.onPress=_defaultOnPress,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress as void Function()?,
      child: Container(
        child: childCard,
        // height: 180,
        // width: 170,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
 void _defaultOnPress() {
// Default empty function
}
