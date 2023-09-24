import 'package:flutter/material.dart';
import 'package:tops/constants/colorPallet.dart';
import 'package:tops/constants/imagePallet.dart';
import 'package:tops/constants/style.dart';
import 'package:tops/dashScreen.dart';
import 'package:get/get.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            width: _size.width,
            height: _size.height,
            color: Colors.transparent,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 80, 40, 0),
                  child: Image.asset(
                    logo,
                    width: 380,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 150, 30, 30),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: username,
                        decoration: InputDecoration(
                          focusedBorder: StyleField.styleBorder,
                          enabledBorder: StyleField.styleBorder,
                          labelText: "Username",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.person_outline_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        controller: password,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          focusedBorder: StyleField.styleBorder,
                          enabledBorder: StyleField.styleBorder,
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.white,
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.white,
                            ),
                          ),
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: SizedBox(
                        width: _size.width * 0.85,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => dashScreen(
                                  index: 1,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: ColorPallet.whiteBasic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPallet.greenPrimary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 40,
                        left: 30,
                        right: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: _size.width * 0.35,
                            height: 1,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'or'.toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 5),
                          Container(
                            width: _size.width * 0.35,
                            height: 1,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: SizedBox(
                        width: _size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                google,
                                width: 30,
                              ),
                              SizedBox(width: 20),
                              Text('Sign in with Google'),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            splashFactory: NoSplash.splashFactory,
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                width: 1,
                                color: ColorPallet.whiteBasic,
                              ),
                            ),
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 50.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't already exist account? ",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed('/register');
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: ColorPallet.greenPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
