import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets/colors/color_app.dart';
import 'package:spotify_flutter/assets/res/images.dart';
import 'package:spotify_flutter/localizations_ext.dart';
import 'package:spotify_flutter/screens/authen/register_screen/register_screen.dart';
import 'package:spotify_flutter/screens/authen/sign_in_screen/sign_in_screen.dart';
import 'package:spotify_flutter/screens/authen/widgets/header_authen.dart';

class AuthenScreen extends StatelessWidget {
  const AuthenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final paddingTop = statusBarHeight + 55;
    return Scaffold(
        backgroundColor: const Color(0xff1A1A1A),
        body: Stack(
          children: [
            const HeaderAuthen(
              showLogo: false,
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Image.asset(LocalAssetImage.imgUnionTop),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(LocalAssetImage.imgUnionBot),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Image.asset(LocalAssetImage.imgEliesUnion),
            ),
            Container(
              padding: EdgeInsets.only(
                top: paddingTop,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 60, bottom: 50),
                      child: Image.asset(
                        LocalAssetImage.icLogo,
                        width: 235,
                        height: 71,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        AppLocalizations.of(context).title_intro,
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        AppLocalizations.of(context).authen_description,
                        style: const TextStyle(fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Material(
                                  color: ColorApp.primary,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const RegisterScreen()));
                                    },
                                    child: Container(
                                      width: 147,
                                      height: 73,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  )),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Material(
                                  color: const Color(0xff1A1A1A),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignInScreen()));
                                    },
                                    child: Container(
                                      width: 147,
                                      height: 73,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  )),
                            ),
                          ]),
                    )
                  ]),
            ),
          ],
        ));
  }
}
