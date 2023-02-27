import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets/colors/color_app.dart';
import 'package:spotify_flutter/localizations_ext.dart';
import 'package:spotify_flutter/screens/authen/authen_screen/authen_screen.dart';
import 'package:spotify_flutter/screens/authen/register_screen/register_screen.dart';
import 'package:spotify_flutter/screens/authen/sign_in_screen/sign_in_screen.dart';
import 'package:spotify_flutter/screens/bottom_navigation/bottom_navigation.dart';
import 'package:spotify_flutter/screens/splash_screen/splash_screen.dart';
import 'package:spotify_flutter/services/firebase/firebase_service.dart';
import 'package:spotify_flutter/utils/global_util.dart';

void main() {
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({super.key});
  @override
  State<StatefulWidget> createState() {
    return ApplicationState();
  }
}

class ApplicationState extends State<Application> {
  late FirebaseService firebase;
  @override
  void initState() {
    super.initState();
    fire();
    // FirebaseService.intance.handleBackgroundMessage();
  }

  Future<void> fire() async {
    await Firebase.initializeApp().whenComplete(() {
      firebase = FirebaseService();
      firebase.initInstance();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: GlobalUtil.navigationKey,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: const Locale('vi'),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Satoshi',
          brightness: Brightness.light,
          primaryColor: Colors.white),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        backgroundColor: const Color(0xff1A1A1A),
        fontFamily: 'Satoshi',
      ),
      themeMode: ThemeMode.dark,
      home: WillPopScope(
          child: AuthenScreen(),
          onWillPop: () async {
            return false;
          }),
    );
  }
}
