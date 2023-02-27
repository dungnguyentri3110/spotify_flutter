import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets/colors/color_app.dart';
import 'package:spotify_flutter/assets/res/images.dart';
import 'package:spotify_flutter/screens/authen/widgets/header_authen.dart';
import 'package:spotify_flutter/screens/authen/widgets/input_authen.dart';
import 'package:spotify_flutter/screens/bottom_navigation/bottom_navigation.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff1A1A1A),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: HeaderAuthen(
          showLogo: true,
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 60, bottom: 30),
            alignment: Alignment.center,
            child: Text(
              "Sign In",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ),
          RichText(
              text: TextSpan(style: TextStyle(fontSize: 12), children: [
            TextSpan(text: "If you need any support"),
            TextSpan(
                text: " Click Here", style: TextStyle(color: ColorApp.primary))
          ])),
          Container(
              margin: const EdgeInsets.only(top: 38),
              child: InputAuthen(
                hintText: "Enter Username Or Email",
              )),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: InputAuthen(
                hintText: "Password",
                isPassword: true,
              )),
          Container(
            height: 80,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Material(
                  color: ColorApp.primary,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationScreen()));
                    },
                    child: Center(
                        child: Text(
                      "Sign In",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    )),
                  ),
                )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 25, right: 10),
                    height: 1,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
                Text("Or"),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 25, left: 10),
                    height: 1,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 8, right: 36),
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      LocalAssetImage.icGoogle,
                      width: 36,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 36),
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      LocalAssetImage.icApple,
                      width: 36,
                    ),
                  ),
                )
              ],
            ),
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(text: "Not A Member? ", style: TextStyle(fontSize: 14)),
            TextSpan(
                text: "Register Now",
                style: TextStyle(fontSize: 14, color: Colors.blue)),
          ]))
        ]),
      ),
    );
  }
}
