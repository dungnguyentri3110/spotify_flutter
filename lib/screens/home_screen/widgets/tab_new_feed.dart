import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets/colors/color_app.dart';
import 'package:spotify_flutter/screens/home_screen/widgets/page_item.dart';
import 'package:spotify_flutter/screens/home_screen/widgets/tab_item.dart';
import 'package:spotify_flutter/utils/global_util.dart';

class TabNewFeed extends StatefulWidget {
  final Function(int index) onChangeTab;
  const TabNewFeed({Key? key, required this.onChangeTab}) : super(key: key);

  @override
  _TabNewFeedState createState() => _TabNewFeedState();
}

class _TabNewFeedState extends State<TabNewFeed> {
  int currentIndex = 0;

  void onChangeTab(int index) {
    widget.onChangeTab(index);
    setState(() {
      currentIndex = index;
    });
  }

  double caculPosition() {
    double position = (55 * ((currentIndex * 2) + 1)) - 14;
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              SizedBox(
                  width: GlobalUtil.screenWidth,
                  height: 50,
                  child: LayoutBuilder(
                    builder: (context, builder) {
                      return SingleChildScrollView(
                        // padding: const EdgeInsets.symmetric(horizontal: 25),
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: 110 * 4,
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: Alignment.centerLeft,
                            children: [
                              Positioned(
                                left: 0,
                                child: TabItem(
                                  label: "News",
                                  index: 0,
                                  onChangeTab: onChangeTab,
                                ),
                              ),
                              Positioned(
                                left: 110,
                                child: TabItem(
                                  label: "Video",
                                  index: 1,
                                  onChangeTab: onChangeTab,
                                ),
                              ),
                              Positioned(
                                left: 110 * 2,
                                child: TabItem(
                                  label: "Artists",
                                  index: 2,
                                  onChangeTab: onChangeTab,
                                ),
                              ),
                              Positioned(
                                left: 110 * 3,
                                child: TabItem(
                                  label: "Podcast",
                                  index: 3,
                                  onChangeTab: onChangeTab,
                                ),
                              ),
                              AnimatedPositioned(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.fastOutSlowIn,
                                  bottom: 0,
                                  left: caculPosition(),
                                  child: Container(
                                    width: 28,
                                    height: 3,
                                    decoration: BoxDecoration(
                                        color: ColorApp.primary,
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5))),
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                  )),
              Expanded(
                child: PageView(
                  children: const [PageItem()],
                ),
              ),
            ],
          )),
    );
  }
}
