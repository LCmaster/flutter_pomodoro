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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            decoration: BoxDecoration(
              color: Colors.red,
              // gradient: LinearGradient(
              //   colors: [
              //     // Color(0xFFCB2611),
              //     // Colors.red,
              //     // Color(0xFFCB2611),
              //     HSVColor.fromColor(Colors.red).withValue(0.45).toColor(),
              //     HSVColor.fromColor(Colors.red).withSaturation(0.85).toColor(),
              //     HSVColor.fromColor(Colors.red).withValue(0.45).toColor(),
              //   ],
              //   begin: Alignment.centerLeft,
              //   end: Alignment.centerRight,
              // ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: const [
                    AudioSection(),
                    Divider(),
                    TimerSection(),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
