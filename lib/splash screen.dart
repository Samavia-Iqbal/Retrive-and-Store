import 'dart:async';

import 'package:flutter/material.dart';

import 'LoginPage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
       backgroundColor: Color(0xffB81836),
        body: Center(
          child: Icon(
            Icons.home,
            color: Colors.white,
            size:100,
          ),
        ));
  }
}
