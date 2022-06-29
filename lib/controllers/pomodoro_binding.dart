import 'package:flutter_pomodoro/controllers/pomodoro_controller.dart';
import 'package:get/get.dart';

class PomodoroBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PomodoroController());
  }
}