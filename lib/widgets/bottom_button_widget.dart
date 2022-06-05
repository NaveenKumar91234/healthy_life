import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  const BottomButton({Key? key, required this.buttonText, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text(buttonText, style: klabelLargeTextStyle),
        ),
        color: kbottomContainerColor,
        height: kbottomContainerHeight,
        width: 280,
        margin: const EdgeInsets.only(top: 10.0),
      ),
      onTap: onTap,
    );
  }
}
