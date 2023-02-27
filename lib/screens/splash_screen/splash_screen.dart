import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets/colors/color_app.dart';
import 'package:spotify_flutter/assets/res/images.dart';
import 'package:spotify_flutter/screens/intro_app_screen/intro_app_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const IntroAppScreen()),
            (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.blackPrimary,
      body: Center(
        child: Image.asset(LocalAssetImage.icLogo),
      ),
    );
  }
}
