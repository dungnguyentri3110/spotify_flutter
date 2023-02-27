import 'package:flutter/material.dart';

class TabItem extends StatefulWidget {
  final String label;
  final int index;
  final Function(int index) onChangeTab;
  const TabItem(
      {Key? key,
      required this.label,
      required this.index,
      required this.onChangeTab})
      : super(key: key);

  @override
  _TabItemState createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 110, maxHeight: 50),
      child: GestureDetector(
        onTap: () {
          widget.onChangeTab(widget.index);
        },
        child: Container(
          // color: Colors.yellow,
          alignment: Alignment.center,
          child: Text(
            widget.label,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
