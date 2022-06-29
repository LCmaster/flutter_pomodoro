import 'package:flutter_pomodoro/controllers/pomodoro_binding.dart';
import 'package:flutter_pomodoro/controllers/settings_binding.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'pages/settings/settings_page.dart';
import 'pages/pomodoro/pomodoro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Pomodoro',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ),
      ),
      getPages: [
        GetPage(
          name: PomodoroPage.routeName,
          page: () => const PomodoroPage(),
          bindings: [
            PomodoroBinding(),
            SettingsBinding(),
          ],
        ),
        GetPage(
          name: SettingsPage.routeName,
          page: () => const SettingsPage(),
          binding: SettingsBinding(),
        ),
      ],
      initialRoute: PomodoroPage.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
