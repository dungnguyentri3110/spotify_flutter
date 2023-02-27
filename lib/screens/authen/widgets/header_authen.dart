import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets/res/images.dart';

class HeaderAuthen extends StatelessWidget {
  final bool showLogo;
  const HeaderAuthen({Key? key, required this.showLogo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      height: 55 + statusBarHeight,
      padding: EdgeInsets.only(top: statusBarHeight, left: 23, right: 23),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Material(
                  color: const Color(0xff201F1F),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  )),
            ),
          ),
          if (showLogo) ...{
            Expanded(
                child: Image.asset(
              LocalAssetImage.icLogo,
              width: 108,
              height: 33,
            )),
          },
          Container(
            width: 40,
          )
        ],
      ),
    );
  }
}
