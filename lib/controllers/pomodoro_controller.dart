import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/constants.dart';
import 'package:get/get.dart';

import 'audio_controller.dart';

enum PomodoroStatus {
  started,
  stopped,
  paused,
}

class PomodoroController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final AudioController _audioController = Get.put(AudioController());

  late final AnimationController _animationController;
  late final Animation<double> animation;

  final isResting = false.obs;
  final status = PomodoroStatus.stopped.obs;

  final pomodoroDuration = kPomodoroDurationList[3].obs;
  final pomodoroProgression = kPomodoroDurationList[3].toDouble().obs;

  void updateResting(bool resting) {
    isResting(resting);
  }

  void updatePomodoroDuration(int duration) {
    pomodoroDuration(duration);
  }

  @override
  void onInit() {
    super.onInit();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(minutes: pomodoroDuration.value),
    )
    ..addStatusListener((animationStatus) {
      if(animationStatus == AnimationStatus.completed){
        status(PomodoroStatus.stopped);
        _audioController.ring();
      }
    });
    animation = Tween(begin: pomodoroProgression.value, end: 0.0)
        .animate(_animationController);
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }

  start() {
    status(PomodoroStatus.started);
    _animationController.forward();
    _audioController.startTicking();
  }

  stop() {
    status(PomodoroStatus.stopped);
    _animationController.stop();
    _audioController.stopTicking();
  }
}
