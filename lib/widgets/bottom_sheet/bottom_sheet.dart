import 'package:flutter/material.dart';
import 'package:spotify_flutter/utils/global_util.dart';

class BottomDialog {
  BottomDialog.init();

  static final BottomDialog instance = BottomDialog.init();

  void show(BuildContext context, Widget renderContent) {
    showDialog(
        context: context,
        builder: ((context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: GlobalUtil.screenWidth,
                    height: 500,
                    decoration: const BoxDecoration(
                        color: const Color(0xff1A1A1A),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(children: [
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        height: 50,
                        child: GestureDetector(
                          onTap: (() {
                            hide(context);
                          }),
                          child: const Icon(
                            Icons.close,
                          ),
                        ),
                      ),
                      renderContent
                    ]),
                  ))
            ]),
          );
        }));
  }

  void hide(BuildContext context) {
    Navigator.pop(context);
  }
}
