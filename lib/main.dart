import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/firebase_curd_demos/get_information.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/screens/screen1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FBFlutterApp());
}

class FBFlutterApp extends StatelessWidget {
  const FBFlutterApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HealthLife(),
      debugShowCheckedModeBanner: false,
    );
  }
}
