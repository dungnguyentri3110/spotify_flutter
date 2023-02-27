import 'package:flutter/material.dart';

class HeaderApp extends StatelessWidget {
  final String title;
  const HeaderApp({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: statusBarHeight + 55,
      padding: EdgeInsets.only(top: statusBarHeight, left: 20, right: 20),
      width: screenWidth,
      // color: Colors.red,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Container(
                width: 32,
                height: 32,
                color: const Color(0xff212121),
                padding: const EdgeInsets.only(left: 5),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                ),
              ),
            ),
          ),
          Expanded(
              child: Center(
                  child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ))),
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: const SizedBox(
                width: 32,
                height: 32,
                child: Icon(
                  Icons.more_vert,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
