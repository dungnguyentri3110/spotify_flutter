import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets/colors/color_app.dart';
import 'package:spotify_flutter/assets/res/images.dart';
import 'package:spotify_flutter/localizations_ext.dart';

class ContentIntroSecondPage extends StatefulWidget {
  final Function onPressPage2;
  const ContentIntroSecondPage({Key? key, required this.onPressPage2})
      : super(key: key);

  @override
  _ContentIntroSecondPageState createState() => _ContentIntroSecondPageState();
}

class _ContentIntroSecondPageState extends State<ContentIntroSecondPage> {
  bool darkMode = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: Text(
            AppLocalizations.of(context).mode_title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          width: 233,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 120,
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          height: 120,
                        ),
                        if (darkMode) ...{
                          Positioned(
                            top: 38,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ColorApp.primary),
                            ),
                          )
                        },
                        Positioned(
                            // bottom: 20,
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(73),
                              child: Container(
                                width: 73,
                                height: 73,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(73),
                                ),
                                child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 21.75, sigmaY: 21.75),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          darkMode = true;
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white.withOpacity(0.01),
                                        child: Image.asset(
                                          LocalAssetImage.icDarkMode,
                                          width: 36,
                                          height: 36,
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                AppLocalizations.of(context).dark_mode,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        )),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          height: 120,
                        ),
                        if (!darkMode) ...{
                          Positioned(
                            top: 38,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ColorApp.primary),
                            ),
                          )
                        },
                        Positioned(
                            // bottom: 20,
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(73),
                              child: Container(
                                width: 73,
                                height: 73,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(73),
                                ),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 21.75, sigmaY: 21.75),
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          darkMode = false;
                                        });
                                      },
                                      child: Container(
                                        color: Colors.grey.withOpacity(0.01),
                                        child: Image.asset(
                                          LocalAssetImage.icLightMode,
                                          width: 36,
                                          height: 36,
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                AppLocalizations.of(context).light_mode,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        )),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 70, bottom: 40),
          child: Material(
            color: ColorApp.primary,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  widget.onPressPage2();
                },
                child: Container(
                  height: 92,
                  width: screenWidth - 66,
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context).button_continue,
                    style: const TextStyle(
                        fontSize: 22,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                )),
          ),
        )
      ],
    );
  }
}
