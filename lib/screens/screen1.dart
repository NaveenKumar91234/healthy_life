import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/screen2.dart';
import 'package:flutter_application_1/utils/constants.dart';

//import 'package:get/get.dart';
//import 'package:page_transition/page_transition.dart';
//import 'package:swipeable_button_view/swipeable_button_view.dart';
class HealthLife extends StatelessWidget {
  const HealthLife({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: const NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR72ksO4CUQt0kB_NDI1sJ0ZnVvhg9zaUSL3Q&usqp=CAU"),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        )),
        child: Scaffold(
            body: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/apple_modified.png',
                      height: 300.0,
                      width: 300.0,
                    ),
                    const Text(
                      ' Welcome \n to healthy life',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 241, 232, 232),
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ),
                    ),
                  ]),
            ),
            backgroundColor: Colors.transparent,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BMIInputPage()),
                );
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.arrow_forward),
            )));
  }
}
