import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets/colors/color_app.dart';
import 'package:spotify_flutter/assets/res/images.dart';
import 'package:spotify_flutter/screens/bottom_navigation/widgets/bottom_tab.dart';
import 'package:spotify_flutter/utils/global_util.dart';

class BottomTabBar extends StatefulWidget {
  final Function(int index) onChangeTab;
  const BottomTabBar({Key? key, required this.onChangeTab}) : super(key: key);

  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int currentIndex = 0;

  void onPressChangeTab(int index) {
    widget.onChangeTab(index);
    setState(() {
      currentIndex = index;
    });
  }

  double caculPositionIndicator() {
    double tabwidth = GlobalUtil.screenWidth / 4;
    double halfTab = tabwidth / 2;
    double indicatorWidth = 23;
    double position =
        (((currentIndex * 2) + 1) * halfTab) - (indicatorWidth / 2);
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60 + GlobalUtil.bottomSpace,
      padding: EdgeInsets.only(bottom: GlobalUtil.bottomSpace),
      color: Colors.yellow,
      child: Stack(
        children: [
          Row(
            children: [
              BottomTab(
                icon: currentIndex == 0
                    ? LocalAssetImage.icHomeActive
                    : LocalAssetImage.icHomeInActive,
                index: 0,
                onChangeTab: onPressChangeTab,
              ),
              BottomTab(
                icon: LocalAssetImage.icDiscoveryInActive,
                index: 1,
                onChangeTab: onPressChangeTab,
              ),
              BottomTab(
                icon: currentIndex == 2
                    ? LocalAssetImage.icLoveActive
                    : LocalAssetImage.icLoveInActive,
                index: 2,
                onChangeTab: onPressChangeTab,
              ),
              BottomTab(
                icon: LocalAssetImage.icUserInActive,
                index: 3,
                onChangeTab: onPressChangeTab,
              ),
            ],
          ),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: caculPositionIndicator(),
              curve: Curves.fastLinearToSlowEaseIn,
              child: Container(
                width: 23,
                height: 4,
                decoration: BoxDecoration(
                    color: ColorApp.primary,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
              ))
        ],
      ),
    );
  }
}
