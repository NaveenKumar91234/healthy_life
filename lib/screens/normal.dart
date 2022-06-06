import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';

class Normal extends StatelessWidget {
  const Normal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
          child: Text(
        "Keep Continue Your Diet as Same Mannner",
        style:
            TextStyle(fontSize: 25.0, color: Color.fromARGB(255, 32, 24, 24)),
      )),
    );
  }
}
