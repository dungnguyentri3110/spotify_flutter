import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_flutter/assets/colors/color_app.dart';
import 'package:spotify_flutter/assets/res/images.dart';
import 'package:spotify_flutter/blocs/home_bloc/bloc/home_bloc.dart';
import 'package:spotify_flutter/blocs/home_bloc/home_event/home_event.dart';
import 'package:spotify_flutter/screens/home_screen/widgets/header.dart';
import 'package:spotify_flutter/screens/home_screen/widgets/tab_new_feed.dart';
import 'package:spotify_flutter/services/api/api_manager.dart';
import 'package:spotify_flutter/services/api/products/music/music_api.dart';
import 'package:spotify_flutter/services/api/status_request.dart';
// import 'package:spotify_flutter/screens/home_screen/widgets/tab_new_feed.dart';
import 'package:spotify_flutter/utils/permission_util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  void onChangeTab(int index) {}

  @override
  void initState() {
    super.initState();
    //Lay danh sach list nhac
    print("nhay vao ay");
    Future.delayed(const Duration(milliseconds: 300), () {
      context.read<HomeBloc>().add(FetchListMusic());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(),
        Expanded(
            child: Column(
          children: [
            SizedBox(
              height: 118,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorApp.primary,
                      borderRadius: BorderRadius.circular(30)),
                  child: Stack(fit: StackFit.expand, children: [
                    Positioned(
                        right: 0,
                        child: Image.asset(LocalAssetImage.imgUnionTop)),
                    Positioned(
                        left: 20,
                        top: 10,
                        bottom: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New Album",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 10),
                              child: Text(
                                "Happy than ever",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                            Text(
                              "Billie Eilish",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal),
                            ),
                          ],
                        ))
                  ]),
                ),
              ),
            ),
            TabNewFeed(
              onChangeTab: onChangeTab,
            ),
          ],
        ))
      ],
    );
  }
}
