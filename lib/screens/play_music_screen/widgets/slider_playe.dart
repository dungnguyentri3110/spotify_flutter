import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_flutter/blocs/play_music_bloc/bloc/play_music_bloc.dart';
import 'package:spotify_flutter/blocs/play_music_bloc/event/play_music_event.dart';
import 'package:spotify_flutter/blocs/play_music_bloc/state/play_music_state.dart';
import 'package:spotify_flutter/utils/time_cacul.dart';

class SliderPlay extends StatefulWidget {
  const SliderPlay({Key? key}) : super(key: key);

  @override
  _SliderPlayeState createState() => _SliderPlayeState();
}

class _SliderPlayeState extends State<SliderPlay> {
  double currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: BlocBuilder<PlayMusicBloc, PlayMusicState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Slider(
                    value: state.process,
                    max: 1.0,
                    min: 0.0,
                    thumbColor: const Color(0xffB7B7B7),
                    activeColor: const Color(0xffB7B7B7),
                    inactiveColor: const Color(0xff353535),
                    onChanged: (value) {
                      print("Value $value");
                      context
                          .read<PlayMusicBloc>()
                          .add(SeekPosition(percent: value));
                    },
                    onChangeStart: ((value) {
                      print("onChangeStart $value");
                      context.read<PlayMusicBloc>().add(SeekPositionStart());
                    }),
                    onChangeEnd: ((value) {
                      print("onChangeEnd $value");
                      context.read<PlayMusicBloc>().add(SeekPositionEnd());
                    }),
                  )),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.timer),
                    Text(TimeCacul.instance.caculTime(state.duration))
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
