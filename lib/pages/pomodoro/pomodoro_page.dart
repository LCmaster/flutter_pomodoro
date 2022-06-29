import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../controllers/pomodoro_controller.dart';
import './widgets/clock_cap.dart';
import './widgets/main_body.dart';
import '../settings/settings_page.dart';

class PomodoroPage extends GetView<PomodoroController> {
  static const routeName = '/pomodoro';

  const PomodoroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const MainBody(),
          Obx(
            () => AnimatedBuilder(
              animation: controller.animation,
              builder: (animContext, widget) {
                return ClockCap(
                  barCount: 60,
                  duration: controller.pomodoroDuration.value,
                  progression: controller.animation.value,
                );
              }
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SettingsPage.routeName);
              },
              child: Column(
                children: const [
                  Icon(
                    Icons.undo,
                    color: Colors.white70,
                  ),
                  Text(
                    'Reset',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SettingsPage.routeName);
              },
              child: Column(
                children: const [
                  Icon(
                    Icons.settings,
                    color: Colors.white70,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Obx(() {
        return FloatingActionButton(
          onPressed: controller.status.value == PomodoroStatus.started
              ? controller.stop
              : controller.start,
          child: Icon(controller.status.value == PomodoroStatus.started
              ? Icons.pause
              : Icons.play_arrow),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
