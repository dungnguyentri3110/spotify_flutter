import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets/res/images.dart';

class InputAuthen extends StatefulWidget {
  final String hintText;
  final bool? isPassword;
  const InputAuthen({Key? key, required this.hintText, this.isPassword})
      : super(key: key);

  @override
  _InputAuthenState createState() => _InputAuthenState();
}

class _InputAuthenState extends State<InputAuthen> {
  bool showPass = false;

  bool? checkPassword() {
    if (widget.isPassword == true) {
      if (showPass) return false;
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xff353434)),
            // color: Colors.red,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                obscureText: checkPassword()!,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  border: InputBorder.none,
                ),
              ),
            ),
            if (widget.isPassword == true) ...{
              GestureDetector(
                onTap: () {
                  setState(() {
                    setState(() {
                      showPass = !showPass;
                    });
                  });
                },
                child: Image.asset(LocalAssetImage.icHidePass),
              )
            }
          ],
        ),
      ),
    );
  }
}
