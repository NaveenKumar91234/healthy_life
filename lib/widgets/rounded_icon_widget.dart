import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const RoundedIconButton(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPressed,
        constraints: const BoxConstraints.tightFor(width: 50.0, height: 50.0),
        shape: const CircleBorder(),
        fillColor: kRoundedIconButtonColor,
        child: Icon(icon));
  }
}
