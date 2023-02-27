import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets/colors/color_app.dart';
import 'package:spotify_flutter/assets/res/images.dart';
import 'package:spotify_flutter/localizations_ext.dart';
import 'package:spotify_flutter/screens/authen/authen_screen/authen_screen.dart';
import 'package:spotify_flutter/screens/intro_app_screen/widgets/intro_widget.dart';

class IntroAppScreen extends StatefulWidget {
  const IntroAppScreen({Key? key}) : super(key: key);

  @override
  _IntroAppScreenState createState() => _IntroAppScreenState();
}

class _IntroAppScreenState extends State<IntroAppScreen> {
  PageController controller = PageController();

  void onChangePage(int currentPage) {
    if (currentPage == 1) {
      controller.animateToPage(1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AuthenScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: [
            IntroWidget(
              currentPage: 1,
              onChangePage: onChangePage,
            ),
            IntroWidget(currentPage: 2, onChangePage: onChangePage),
          ]),
    );
  }
}
