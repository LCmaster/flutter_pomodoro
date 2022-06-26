import 'package:flutter/material.dart';

import 'package:get/get.dart';

import './pages/home/home_page.dart';
import './pages/settings_page.dart';

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
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        SettingsPage.routeName: (context) => const SettingsPage(),
      },
      initialRoute: HomePage.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}