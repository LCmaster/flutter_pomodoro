import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../controllers/settings_controller.dart';
import 'widgets/audio_section.dart';
import 'widgets/timer_section.dart';

class SettingsPage extends GetView<SettingsController> {
  static const routeName = '/settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Settings',
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            color:
                HSVColor.fromColor(Colors.red).withSaturation(0.75).toColor(),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Obx(
                    () => AudioSection(
                      ringingVolume: controller.ringingVolume.value,
                      tickingVolume: controller.tickingVolume.value,
                      ringingVolumeCallback: controller.updateRingingVolume,
                      tickingVolumeCallback: controller.updateTickingVolume,
                    ),
                  ),
                  const Divider(),
                  Obx(
                    () => TimerSection(
                      longBreakDuration: controller.longBreakDuration.value,
                      longBreakDurationCallback:
                          controller.updateLongBreakDuration,
                      pomodoroDuration: controller.pomodoroDuration.value,
                      pomodoroDurationCallback:
                          controller.updatePomodoroDuration,
                      shortBreakDuration: controller.shortBreakDuration.value,
                      shortBreakDurationCallback:
                          controller.updateShortBreakDuration,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
