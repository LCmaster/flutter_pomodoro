import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../constants.dart';
import 'audio_controller.dart';

enum PomodoroStatus {
  started,
  stopped,
}

class PomodoroController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final AudioController _audioController = Get.put(AudioController());

  late final AnimationController _animationController;
  late final animation;

  int _index = 0;
  final canReset = false.obs;
  final status = PomodoroStatus.stopped.obs;

  final List<Duration> _pomodoroDurationList = [];

  Duration get currentDuration {
    return _pomodoroDurationList[_index];
  }

  @override
  void onInit() {
    super.onInit();

    _pomodoroDurationList.clear();
    _pomodoroDurationList.addAll(_reset());

    _animationController = AnimationController(
      vsync: this,
      duration: _pomodoroDurationList[_index],
    )..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.completed) {
          completed();
        }
      });
    animation = _setAnimation(_animationController).obs;
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

  List<Duration> _reset() {
    List<Duration> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(Duration(minutes: kPomodoroDurationList[2]));
      list.add(Duration(minutes: kShortBreakDurationList[2]));
    }

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
    _reset();
    _animationController.reset();
    animation(_setAnimation(_animationController));

    canReset(false);
  }
}
