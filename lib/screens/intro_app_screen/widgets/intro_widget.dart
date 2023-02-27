import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets/colors/color_app.dart';
import 'package:spotify_flutter/assets/res/images.dart';
import 'package:spotify_flutter/localizations_ext.dart';
import 'package:spotify_flutter/screens/intro_app_screen/widgets/content_intro_first_page.dart';
import 'package:spotify_flutter/screens/intro_app_screen/widgets/content_intro_second_page.dart';

class IntroWidget extends StatefulWidget {
  final int currentPage;
  final Function(int currentPage) onChangePage;
  const IntroWidget(
      {Key? key, required this.currentPage, required this.onChangePage})
      : super(key: key);

  @override
  _IntroWidgetState createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget>
    with AutomaticKeepAliveClientMixin<IntroWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Stack(alignment: Alignment.center, children: [
      Image.asset(
        widget.currentPage == 2
            ? LocalAssetImage.imgDualipa
            : LocalAssetImage.imgGrande,
        width: screenWidth,
        fit: BoxFit.contain,
      ),
      Positioned(
        top: statusBarHeight,
        child: Image.asset(
          LocalAssetImage.icLogo,
          width: 196,
          height: 59,
        ),
      ),
      Positioned(
          bottom: 40,
          child: widget.currentPage == 1
              ? ContentIntroFirstPage(
                  onPressPage1: () {
                    widget.onChangePage(1);
                  },
                )
              : ContentIntroSecondPage(
                  onPressPage2: () {
                    widget.onChangePage(2);
                  },
                ))
    ]);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
