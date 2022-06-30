import 'package:get/get.dart';

import '../constants.dart';

class SettingsController extends GetxController {
  // Audio Related Properties
  final ringingVolume = 1.0.obs;
  final tickingVolume = 0.8.obs;

  // Timer Related Properties
  final shortBreakDuration = kShortBreakDurationList[kInitialIndex].obs;
  final longBreakDuration = kLongBreakDurationList[kInitialIndex].obs;
  final pomodoroDuration = kPomodoroDurationList[kInitialIndex].obs;

  void updateRingingVolume(double volume) {
    ringingVolume(volume);
  }

  void updateTickingVolume(double volume) {
    tickingVolume(volume);
  }

  void updateShortBreakDuration(int? minutes) {
    shortBreakDuration(minutes);
  }

  void updateLongBreakDuration(int? minutes) {
    longBreakDuration(minutes);
  }

  void updatePomodoroDuration(int? minutes) {
    pomodoroDuration(minutes);
  }
}
