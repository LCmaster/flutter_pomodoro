import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants.dart';

class SettingsController extends GetxController {
  final box = GetStorage();
  // Audio Related Properties
  final ringingVolume = 1.0.obs;
  final tickingVolume = 0.8.obs;

  // Timer Related Properties
  final shortBreakDuration = kShortBreakDurationList[kInitialIndex].obs;
  final longBreakDuration = kLongBreakDurationList[kInitialIndex].obs;
  final pomodoroDuration = kPomodoroDurationList[kInitialIndex].obs;

  @override
  void onInit() {
    super.onInit();
    final storedRingingVolumeValue = box.read('ringingVolume') ?? ringingVolume.value;
    final storedTickingVolumeValue = box.read('tickingVolume') ?? ringingVolume.value;
    ringingVolume(storedRingingVolumeValue);
    tickingVolume(storedTickingVolumeValue);

    final storedShortBreakDurationValue = box.read('shortBreakDuration') ?? shortBreakDuration.value;
    final storedLongBreakDurationValue = box.read('longBreakDuration') ?? longBreakDuration.value;
    final storedPomodoroDurationValue = box.read('pomodoroDuration') ?? pomodoroDuration.value;
    shortBreakDuration(storedShortBreakDurationValue);
    longBreakDuration(storedLongBreakDurationValue);
    pomodoroDuration(storedPomodoroDurationValue);

  }

  void updateRingingVolume(double volume) {
    ringingVolume(volume);
    box.write('ringingVolume', volume);
  }

  void updateTickingVolume(double volume) {
    tickingVolume(volume);
    box.write('tickingVolume', volume);
  }

  void updateShortBreakDuration(int? minutes) {
    shortBreakDuration(minutes);
    box.write('shortBreakDuration', minutes);
  }

  void updateLongBreakDuration(int? minutes) {
    longBreakDuration(minutes);
    box.write('longBreakDuration', minutes);
  }

  void updatePomodoroDuration(int? minutes) {
    pomodoroDuration(minutes);
    box.write('pomodoroDuration', minutes);
  }
}
