import 'dart:io';

import 'package:file_manager/file_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_flutter/assets/colors/color_app.dart';
import 'package:spotify_flutter/assets/res/images.dart';
import 'package:spotify_flutter/screens/authen/widgets/header_authen.dart';
import 'package:spotify_flutter/screens/authen/widgets/input_authen.dart';
import 'package:spotify_flutter/screens/bottom_navigation/bottom_navigation.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  RegisterStateScreen createState() => RegisterStateScreen();
}

class RegisterStateScreen extends State<RegisterScreen> {
  late FlutterLocalNotificationsPlugin plugin;
  late AndroidNotificationChannel chanel;
  late AndroidNotificationDetails androidDetails;
  late NotificationDetails details;
  late AndroidInitializationSettings initializationSettingsAndroid;

  FileManagerController fileManagerController = FileManagerController();

  Future<void> getFiles() async {
    //asyn function to get list of files
    List<Directory>? storageInfo =
        await getExternalStorageDirectories(type: StorageDirectory.downloads);
    var root = storageInfo;
    var fm = await fileManagerController
        .goToParentDirectory()
        .whenComplete(() => print("nhay vao day "));
    var exist = await File(
            '/storage/emulated/0/Android/data/Download/cai eo nho nho.mp3')
        .exists();
    print(
        "nhay vao day /storage/emulated/0/Android/Download/cai eo nho nho.mp3 ${exist}");
  }

  @override
  void initState() {
    super.initState();
    plugin = FlutterLocalNotificationsPlugin();
    chanel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.max,
      description: 'This channel is used for important notifications.',
    );
    androidDetails = AndroidNotificationDetails(chanel.id, chanel.name,
        importance: Importance.max, icon: 'app_icon');
    details = NotificationDetails(android: androidDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff1A1A1A),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: HeaderAuthen(
          showLogo: true,
        ),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 60, bottom: 30),
              alignment: Alignment.center,
              child: Text(
                "Register",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ),
            RichText(
                text: TextSpan(style: TextStyle(fontSize: 12), children: [
              TextSpan(text: "If you need any support"),
              TextSpan(
                  text: " Click Here",
                  style: TextStyle(color: ColorApp.primary))
            ])),
            Container(
                margin: const EdgeInsets.only(top: 38),
                child: InputAuthen(
                  hintText: "Full Name",
                )),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: InputAuthen(
                  hintText: "Enter Email",
                )),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: InputAuthen(
                  hintText: "Password",
                  isPassword: true,
                )),
            Container(
              height: 80,
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Material(
                    color: ColorApp.primary,
                    child: InkWell(
                      onTap: () async {
                        getFiles();
                        // await plugin.show(
                        //     100, "Test Notify", "Spotify", details);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const BottomNavigationScreen()));
                      },
                      child: Center(
                          child: Text(
                        "Create Account",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      )),
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 25, right: 10),
                      height: 1,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                  Text("Or"),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 25, left: 10),
                      height: 1,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 8, right: 36),
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        LocalAssetImage.icGoogle,
                        width: 36,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 36),
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        LocalAssetImage.icApple,
                        width: 36,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Do you have any account? ",
                    style: TextStyle(fontSize: 14)),
                TextSpan(
                    text: "Sign In",
                    style: TextStyle(fontSize: 14, color: Colors.blue)),
              ])),
            )
          ]),
        ),
      ),
    );
  }
}
