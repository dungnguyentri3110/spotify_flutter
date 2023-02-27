import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets/colors/color_app.dart';
import 'package:spotify_flutter/localizations_ext.dart';

const containerTextTitle = EdgeInsets.only(bottom: 30);
const textitle =
    TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w700);
const containerContentMar = EdgeInsets.only(bottom: 30);
const containerPadding = EdgeInsets.symmetric(horizontal: 20);

class ContentIntroFirstPage extends StatelessWidget {
  final Function onPressPage1;
  const ContentIntroFirstPage({Key? key, required this.onPressPage1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: containerTextTitle,
          child:
              Text(AppLocalizations.of(context).title_intro, style: textitle),
        ),
        Container(
          width: screenWidth,
          margin: containerContentMar,
          padding: containerPadding,
          child: Text(
            AppLocalizations.of(context).intro_description,
            style: const TextStyle(color: Color(0xff797979), fontSize: 17.0),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: Material(
            color: ColorApp.primary,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  onPressPage1();
                },
                child: Container(
                  height: 92,
                  width: screenWidth - 66,
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context).button_get_start,
                    style: const TextStyle(
                        fontSize: 22,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
