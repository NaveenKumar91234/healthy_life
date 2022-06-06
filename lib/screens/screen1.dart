import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/screen2.dart';
import 'package:flutter_application_1/utils/constants.dart';

class HealthLife extends StatelessWidget {
  const HealthLife({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images.png'), fit: BoxFit.fill),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BMIInputPage()),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
