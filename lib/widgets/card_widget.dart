import 'package:flutter/material.dart';

class CardControl extends StatelessWidget {
  final Color bgColor;
  final Widget cardChild;
  final VoidCallback onPress;
  const CardControl(
      {Key? key,
      required this.bgColor,
      required this.cardChild,
      required this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Container(
          child: cardChild,
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        ));
  }
}
