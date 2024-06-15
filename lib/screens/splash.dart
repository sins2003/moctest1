import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moctest1/screens/signup.dart';

import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCkjfm2bAzRRzuGmzkBHtvK1TgqDHjkF_8",
          appId: "1:13383654201:android:5ce030531f5dbab2c926e8",
          messagingSenderId: "",
          projectId: "moctest-41609",
          storageBucket: "moctest-41609.appspot.com"));
  runApp(MaterialApp(
    home:splash(),
    //splash(),
    debugShowCheckedModeBanner: false,
  ));
}

class splash extends StatefulWidget {
  @override
  State<splash> createState() => _QsplashState();
}

class _QsplashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loginpage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Image(
          image: AssetImage(
            "assets/images/shopingbag.png",
          ),
          height: 100,
          width: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}
