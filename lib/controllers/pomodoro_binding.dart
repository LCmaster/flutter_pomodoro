import 'package:flutter_pomodoro/controllers/audio_controller.dart';
import 'package:get/get.dart';

import 'pomodoro_controller.dart';

class PomodoroBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AudioController());
    Get.lazyPut(() => PomodoroController());
  }
}