import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets/res/images.dart';

class BottomTab extends StatefulWidget {
  final String icon;
  final Function(int index) onChangeTab;
  final int index;

  const BottomTab(
      {Key? key,
      required this.icon,
      required this.onChangeTab,
      required this.index})
      : super(key: key);

  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
      child: InkWell(
          onTap: () {
            widget.onChangeTab(widget.index);
          },
          child: Center(
            child: Image.asset(
              widget.icon,
              width: 28,
              height: 28,
            ),
          )),
    ));
  }
}
