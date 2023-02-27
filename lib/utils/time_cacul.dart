class TimeCacul {
  TimeCacul.init();

  static final TimeCacul instance = TimeCacul.init();

  String caculTime(double time) {
    String minutes = ((time / 60) % 60).floor().toString().padLeft(2, '0');
    String seconds = (time % 60).floor().toString().padLeft(2, '0');
    return '$minutes : $seconds';
  }
}
