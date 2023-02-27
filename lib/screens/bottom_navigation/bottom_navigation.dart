import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets/colors/color_app.dart';
import 'package:spotify_flutter/screens/bottom_navigation/widgets/bottom_tab_bar.dart';
import 'package:spotify_flutter/screens/discovery_screen/discovery_screen.dart';
import 'package:spotify_flutter/screens/home_screen/home_screen.dart';
import 'package:spotify_flutter/screens/love_screen/love_screen.dart';
import 'package:spotify_flutter/screens/user_screen/user_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigationScreen> {
  int currentIndex = 0;
  late PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
  }

  void onChangeTab(int index) {
    controller.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A1A1A),
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            HomeScreen(),
            DiscoveryScreen(),
            LoveScreen(),
            UserScreen()
          ]),
      bottomNavigationBar: BottomTabBar(
        onChangeTab: onChangeTab,
      ),
    );
  }
}
