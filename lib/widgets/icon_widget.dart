import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';

class IconControl extends StatelessWidget {
  final IconData iconData;
  final String iconText;
  const IconControl({Key? key, required this.iconData, required this.iconText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, size: 70.0, color: kIconBackgroundColor),
        const SizedBox(
          height: 8.0,
        ),
        Text(iconText, style: klabelTextStyle)
      ],
    );
  }
}
