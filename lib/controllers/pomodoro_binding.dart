import 'package:get/get.dart';

import 'pomodoro_controller.dart';

class PomodoroBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PomodoroController());
  }
}