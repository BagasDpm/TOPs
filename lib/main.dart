import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tops/auth/loginScreen.dart';
import 'package:tops/splashScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'auth/registerScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.goldmanTextTheme()),
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
      routes: {
        '/login': (context) => loginScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
