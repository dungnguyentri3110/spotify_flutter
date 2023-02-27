import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_flutter/blocs/play_music_bloc/bloc/play_music_bloc.dart';
import 'package:spotify_flutter/blocs/play_music_bloc/event/play_music_event.dart';
import 'package:spotify_flutter/blocs/play_music_bloc/state/play_music_state.dart';

class ControllerButton extends StatefulWidget {
  final Function onPlay;
  const ControllerButton({Key? key, required this.onPlay}) : super(key: key);

  @override
  _ControllerButtonState createState() => _ControllerButtonState();
}

class _ControllerButtonState extends State<ControllerButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayMusicBloc, PlayMusicState>(
        builder: ((context, state) {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () {
                      context.read<PlayMusicBloc>().add(RepeatMusic());
                    },
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Icon(
                        Icons.repeat,
                        color: state.repeat == true
                            ? Colors.white
                            : const Color(0xff6D6D6D),
                      ),
                    )),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      width: 35,
                      height: 35,
                      child: Icon(
                        Icons.skip_previous_rounded,
                        size: 35,
                      ),
                    )),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Material(
              color: const Color(0xff42C83C),
              child: InkWell(
                  onTap: () {
                    widget.onPlay();
                  },
                  child: Container(
                    width: 72,
                    height: 72,
                    child: state.play == true
                        ? const Icon(
                            Icons.pause,
                            size: 35,
                          )
                        : const Icon(
                            Icons.play_arrow,
                            size: 35,
                          ),
                  )),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      width: 35,
                      height: 35,
                      child: Icon(
                        Icons.skip_next_rounded,
                        size: 35,
                      ),
                    )),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      width: 35,
                      height: 35,
                      child: Icon(Icons.shuffle),
                    )),
              ),
            ),
          ),
        ]),
      );
    }));
  }
}
