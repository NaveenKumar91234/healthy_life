import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/normal.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:flutter_application_1/widgets/bottom_button_widget.dart';
import 'package:flutter_application_1/widgets/card1_widget.dart';
import 'package:flutter_application_1/screens/screen4_underweight.dart';
import 'package:flutter_application_1/screens/screen4.1_overweight.dart';

class BMIResult extends StatelessWidget {
  final String bmi;
  final String bmiResult;
  final String bmiNarration;
  final String name;

  const BMIResult(
      {Key? key,
      required this.bmi,
      required this.bmiResult,
      required this.bmiNarration,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Result',
            style: TextStyle(
                fontSize: 25.0, color: Color.fromARGB(255, 29, 24, 24))),
        leading: const Icon(Icons.balance),
        backgroundColor: kBackgroundColor,
      ),
      body: Container(
        color: kBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Image.network(
                  "https://www.health-total.com/wp-content/uploads/2019/10/bmi-chart-img.jpg"),
              margin: const EdgeInsets.all(16.0),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                child: Text('Hello ${name} Your BMI is',
                    style: klabelLargeTextStyle),
              ),
            ),
            Expanded(
              flex: 5,
              child: CardControl1(
                  bgColor: kCardActiveBackground,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          bmiResult,
                          style: klabelSubheaderTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          bmi,
                          style: klabelNumberTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          'Normal BMI Range',
                          style: klabelSubheaderTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          '18.5 - 29.9',
                          style: klabelTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          bmiNarration,
                          style: klabelTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        BottomButton(
                            buttonText: 'SUGGESTIONS',
                            onTap: () {
                              if (bmiResult == 'Under Weight') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UnderWeight()));
                              }
                              if (bmiResult == 'Over Weight') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const OverWeight()));
                              }
                              if (bmiResult == 'Normal') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Normal()));
                              }
                            })
                      ]),
                  onPress: () => {}),
            ),
            Expanded(
              child: BottomButton(
                  buttonText: 'RE-CALCULATE',
                  onTap: () {
                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
