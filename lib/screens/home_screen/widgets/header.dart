import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets/res/images.dart';
import 'package:spotify_flutter/utils/global_util.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: GlobalUtil.screenWidth,
      height: 55 + GlobalUtil.statusBarHeight,
      padding:
          EdgeInsets.only(right: 25, left: 25, top: GlobalUtil.statusBarHeight),
      child: Row(
        children: [
          GestureDetector(
            child: Icon(
              Icons.search,
              size: 33,
            ),
          ),
          Expanded(
              child: Image.asset(
            LocalAssetImage.icLogo,
            width: 108,
            height: 33,
          )),
          GestureDetector(
            child: Icon(
              Icons.more_vert,
              size: 33,
            ),
          ),
        ],
      ),
    );
  }
}
