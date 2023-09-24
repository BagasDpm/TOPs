import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tops/constants/colorPallet.dart';
import 'package:tops/constants/imagePallet.dart';
import 'package:tops/constants/style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController cpassword = new TextEditingController();
  bool _obscureText1 = true;
  bool _obscureText2 = true;

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
                  padding: EdgeInsets.fromLTRB(40, 70, 40, 0),
                  child: Image.asset(logo),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 180, 30, 30),
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
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: email,
                        decoration: InputDecoration(
                          focusedBorder: StyleField.styleBorder,
                          enabledBorder: StyleField.styleBorder,
                          labelText: "Email Address",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        controller: password,
                        obscureText: _obscureText1,
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
                                _obscureText1 = !_obscureText1;
                              });
                            },
                            child: Icon(
                              _obscureText1
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
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        controller: cpassword,
                        obscureText: _obscureText2,
                        decoration: InputDecoration(
                          focusedBorder: StyleField.styleBorder,
                          enabledBorder: StyleField.styleBorder,
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.white,
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                _obscureText2 = !_obscureText2;
                              });
                            },
                            child: Icon(
                              _obscureText2
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
                          onPressed: () {},
                          child: Text(
                            'Register',
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
                      padding: EdgeInsets.only(
                        top: 50.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already exist account? ",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed('/login');
                            },
                            child: Text(
                              "Login",
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
