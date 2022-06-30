import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'audio_controller.dart';
import 'settings_controller.dart';

enum PomodoroStatus {
  started,
  stopped,
}

class PomodoroController extends GetxController
    with GetSingleTickerProviderStateMixin {

  final AudioController _audioController = Get.find<AudioController>();
  final SettingsController _settingsController = Get.find<SettingsController>();


  late final AnimationController _animationController;
  late final animation;

  int _index = 0;
  final canReset = false.obs;
  final status = PomodoroStatus.stopped.obs;

  final List<Duration> _pomodoroDurationList = [];

  @override
  void onInit() {
    super.onInit();

    _pomodoroDurationList.clear();
    _pomodoroDurationList.addAll(_resetDurationList());

    _animationController = AnimationController(
      vsync: this,
      duration: _pomodoroDurationList[_index],
    )..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.completed) {
          completed();
        }
      });
    animation = _setAnimation(_animationController).obs;

    _settingsController.pomodoroDuration.listen((p0) {
      reset();
    });
    _settingsController.longBreakDuration.listen((p0) {
      reset();
    });
    _settingsController.shortBreakDuration.listen((p0) {
      reset();
    });
  }

  void completed() {
    status(PomodoroStatus.stopped);
    _audioController.stopTicking();
    _audioController.ring();

    _index++;
    if (_index < _pomodoroDurationList.length) {
      animation(_setAnimation(_animationController));
    }
  }

  Animation<double> _setAnimation(AnimationController animationController) {
    return Tween(
      begin: _pomodoroDurationList[_index].inMinutes.toDouble(),
      end: 0.0,
    ).animate(animationController);
  }

  List<Duration> _resetDurationList() {
    List<Duration> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(Duration(minutes: _settingsController.pomodoroDuration.value));
      list.add(Duration(minutes: _settingsController.shortBreakDuration.value));
    }
    list.add(Duration(minutes: _settingsController.longBreakDuration.value));

    return list;
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
    canReset(true);
  }

  stop() {
    status(PomodoroStatus.stopped);
    _animationController.stop();
    _audioController.stopTicking();
  }

  reset() {
    stop();
    _index = 0;

    _pomodoroDurationList.clear();
    _pomodoroDurationList.addAll(_resetDurationList());

    _animationController.duration = _pomodoroDurationList[_index];
    _animationController.reset();
    animation(_setAnimation(_animationController));

    canReset(false);
  }
}
