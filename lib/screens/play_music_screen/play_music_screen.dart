import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify_flutter/assets/res/images.dart';
import 'package:spotify_flutter/blocs/home_bloc/bloc/home_bloc.dart';
import 'package:spotify_flutter/blocs/play_music_bloc/bloc/play_music_bloc.dart';
import 'package:spotify_flutter/blocs/play_music_bloc/event/play_music_event.dart';
import 'package:spotify_flutter/blocs/play_music_bloc/state/play_music_state.dart';
import 'package:spotify_flutter/screens/play_music_screen/widgets/controller_button.dart';
import 'package:spotify_flutter/screens/play_music_screen/widgets/list_music_bottom_sheet.dart';
import 'package:spotify_flutter/screens/play_music_screen/widgets/slider_playe.dart';
import 'package:spotify_flutter/services/api/products/music/music_response.dart';
import 'package:spotify_flutter/utils/global_util.dart';
import 'package:spotify_flutter/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:spotify_flutter/widgets/header/header_app.dart';
import 'dart:math';

class PlayMusicScreen extends StatelessWidget {
  final ListMusicResponse fileMp3;
  final List<ListMusicResponse> listMusic;
  const PlayMusicScreen(
      {Key? key, required this.fileMp3, required this.listMusic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => PlayMusicBloc(),
          ),
          BlocProvider(create: (_) => HomeBloc()),
        ],
        child: PlayMusicView(
          fileMp3: fileMp3,
          listMusic: listMusic,
        ));
  }
}

class PlayMusicView extends StatefulWidget {
  final ListMusicResponse fileMp3;
  final List<ListMusicResponse> listMusic;
  const PlayMusicView(
      {Key? key, required this.fileMp3, required this.listMusic})
      : super(key: key);

  @override
  PlayMusicViewState createState() => PlayMusicViewState();
}

class PlayMusicViewState extends State<PlayMusicView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late AudioPlayer player = AudioPlayer();
  int duration = 0;

  void onPressPlay() async {
    // // player.pause();
    // await player.play();
    context.read<PlayMusicBloc>().add(StartPlayMusic());
  }

  @override
  void initState() {
    super.initState();

    context.read<PlayMusicBloc>().add(LoadMusic(
        musicUrl: 'http://192.168.22.23:3000/play-music/${widget.fileMp3.id}',
        duration: widget.fileMp3.file_size));

    // player.setUrl('http://172.20.250.44:3000/play-music').then((value) async {
    //   player.positionStream.listen((event) {
    //     int total = player.duration!.inMilliseconds;
    //     double process = event.inMilliseconds / total;
    //     // print(("listen ${event.inMilliseconds}"));
    //     context.read<PlayMusicBloc>().add(PlayingMusic(process: process));
    //   });
    //   // setState(() {
    //   //   duration = player.duration!.inMilliseconds;
    //   // });
    // }).catchError(() {
    //   print("error");
    // });

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    Animation<double> curves =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
    animation = Tween<double>(begin: 0.0, end: (2 * pi)).animate(curves);
    animationController.repeat();
    // BottomDialog.instance.hide(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: HeaderApp(
          title: "Now playing",
        ),
      ),
      backgroundColor: const Color(0xff1A1A1A),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.rotate(
                angle: animation.value,
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular((screenWidth - 200) / 2),
                    child: Container(
                      color: const Color(0xff212121),
                      width: screenWidth - 200,
                      height: screenWidth - 200,
                      alignment: Alignment.center,
                      child: Image.asset(
                        LocalAssetImage.music,
                        width: 150,
                        height: 150,
                      ),
                    )),
              );
            },
          ),
        ),
        Container(
          width: screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      widget.fileMp3.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        "Chưa xác định",
                        style: TextStyle(fontSize: 13),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SliderPlay(),
        ControllerButton(
          onPlay: onPressPlay,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              BottomDialog.instance.show(
                  context,
                  ListMusicBottomSheet(
                    listData: widget.listMusic,
                    currentId: widget.fileMp3.id,
                  ));
            },
            child: SizedBox(
              height: 40,
              width: 150,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.arrow_drop_up_outlined,
                    size: 28,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: GlobalUtil.bottomSpace),
                    child: const Text("List music"),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }
}
