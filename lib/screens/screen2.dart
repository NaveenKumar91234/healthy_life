import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';
//import 'package:flutter_application_1/widgets/bottom_button_widget.dart';
import 'package:flutter_application_1/widgets/card_widget.dart';
import 'package:flutter_application_1/widgets/card1_widget.dart';
import 'package:flutter_application_1/widgets/icon_widget.dart';
import 'package:flutter_application_1/widgets/rounded_icon_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_1/services/calculate_bmi_service.dart';
import 'package:flutter_application_1/screens/screen3.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';

enum GenderType { male, female }

class BMIInputPage extends StatefulWidget {
  const BMIInputPage({Key? key}) : super(key: key);
  @override
  State<BMIInputPage> createState() => _BMIInputPageState();
}

class _BMIInputPageState extends State<BMIInputPage> {
  GenderType selectedGender = GenderType.male;
  double height = 160;
  int age = 20;
  int weight = 60;
  bool _isFinished = false;
  final TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
          style:
              TextStyle(fontSize: 25.0, color: Color.fromARGB(255, 32, 24, 24)),
        ),
        leading: const Icon(Icons.balance),
        backgroundColor: kBackgroundColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _name,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.male_rounded),
                  labelText: "Enter Name"),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardControl(
                        bgColor: selectedGender == GenderType.male
                            ? kCardActiveBackground
                            : kCardInActiveBackground,
                        cardChild: const IconControl(
                            iconData: FontAwesomeIcons.person,
                            iconText: 'MALE'),
                        onPress: () {
                          setState(() {
                            selectedGender = GenderType.male;
                          });
                        }),
                  ),
                  Expanded(
                    child: CardControl(
                        bgColor: selectedGender == GenderType.female
                            ? kCardActiveBackground
                            : kCardInActiveBackground,
                        cardChild: const IconControl(
                            iconData: FontAwesomeIcons.personDress,
                            iconText: 'FEMALE'),
                        onPress: () {
                          setState(() {
                            selectedGender = GenderType.female;
                          });
                        }),
                  )
                ],
              ),
            ),
            Expanded(
              child: CardControl1(
                  bgColor: kCardActiveBackground,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('HEIGHT', style: klabelSubheaderTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toStringAsFixed(1),
                              style: klabelNumberTextStyle),
                          const Text('cm', style: klabelTextStyle)
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: kSliderActiveColor,
                            inactiveTrackColor: kSliderInactiveColor,
                            trackShape: const RectangularSliderTrackShape(),
                            trackHeight: 4.0,
                            thumbColor: kSliderThumbColor,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 12.0),
                            overlayColor: kSliderThumbColor.withAlpha(60),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 28.0)),
                        child: Slider(
                            value: height,
                            min: 100.0,
                            max: 250.0,
                            onChanged: (newValue) {
                              setState(() {
                                height = newValue;
                              });
                            }),
                      )
                    ],
                  ),
                  onPress: () {}),
            ),
            Expanded(
              child: Row(children: [
                Expanded(
                  child: CardControl1(
                      bgColor: kCardActiveBackground,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('WEIGHT', style: klabelSubheaderTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(weight.toString(),
                                  style: klabelNumberTextStyle),
                              const Text('kg', style: klabelTextStyle)
                            ],
                          ),
                          Row(children: [
                            Expanded(
                              child: RoundedIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                            ),
                            Expanded(
                              child: RoundedIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ),
                          ])
                        ],
                      ),
                      onPress: () {}),
                ),
                Expanded(
                  child: CardControl1(
                      bgColor: kCardActiveBackground,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('AGE', style: klabelSubheaderTextStyle),
                          Text('$age', style: klabelNumberTextStyle),
                          Row(children: [
                            Expanded(
                              child: RoundedIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      if (age > 0) age--;
                                    });
                                  }),
                            ),
                            Expanded(
                              child: RoundedIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ),
                          ])
                        ],
                      ),
                      onPress: () {}),
                ),
              ]),
            ),
            Container(
              child: SwipeableButtonView(
                  isFinished: _isFinished,
                  onFinish: () async {
                    var bmi = CalculateBMI(height, weight);
                    await Navigator.push(
                        context,
                        PageTransition(
                            child: BMIResult(
                                bmi: bmi.calculate(),
                                bmiResult: bmi.getResult(),
                                bmiNarration: bmi.getNarration(),
                                name: _name.text),
                            type: PageTransitionType.fade));

                    setState(() {
                      _isFinished = false;
                    });
                  },
                  onWaitingProcess: () {
                    //Calculate BMI here
                    CalculateBMI(height, weight);

                    Future.delayed(const Duration(seconds: 1), () {
                      setState(() {
                        _isFinished = true;
                      });
                    });
                  },
                  activeColor: const Color.fromARGB(255, 211, 89, 119),
                  buttonWidget: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                  ),
                  buttonText: "CALCULATE",
                  buttontextstyle: klabelLargeTextStyles),
            ),
          ],
        ),
      ),
    );
  }
}
