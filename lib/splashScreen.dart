import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tops/constants/imagePallet.dart';
import 'package:tops/auth/loginScreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  startsplashScreen() async {
    final duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => loginScreen(),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    startsplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(left: 20.0),
        width: _size.width * 0.85,
        height: _size.height,
        color: Colors.transparent,
        child: Image.asset(
          mainLogo,
        ),
      ),
    );
  }
}
