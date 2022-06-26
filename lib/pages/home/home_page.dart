import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/pages/home/widgets/clock_cap.dart';
import 'package:flutter_pomodoro/pages/home/widgets/main_body.dart';
import 'package:flutter_pomodoro/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int active = -1;
  final List<int> pomodoroList = [25, 5, 25, 5, 15];
  final int minutes = 25;
  bool hasStarted = false;
  bool resting = false;
  late final AnimationController _controller;
  late final Animation<double> _animation;

  final AudioPlayer _ringPlayer = AudioPlayer();
  final AudioPlayer _tickPlayer = AudioPlayer();
  final String _ringSource = 'audio/ring.wav';
  final String _tickSource = 'audio/tick.wav';

  String state = 'Ready to work?';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        minutes: minutes,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _toggleStartStopBottom();
          _ring();
        }
      });
    _animation = Tween<double>(begin: minutes + 1, end: 1).animate(_controller);

    _init();
  }

  Future<void> _init() async {
    await _ringPlayer.setVolume(1.0);
    await _ringPlayer.setSource(AssetSource(_ringSource));
    // await _player.setPlayerMode(PlayerMode.lowLatency);
    // await _ringPlayer.setReleaseMode(ReleaseMode.loop);

    await _tickPlayer.setVolume(1.0);
    final bytes = await AudioCache.instance.loadAsBytes(_tickSource);
    await _tickPlayer.setSource(BytesSource(bytes));
    // await _player.setPlayerMode(PlayerMode.lowLatency);
    await _tickPlayer.setReleaseMode(ReleaseMode.loop);
  }

  Future<void> _ring() async {
    await _ringPlayer.stop();
    await _ringPlayer.resume();
  }

  Future<void> _tick() async {
    await _tickPlayer.seek(Duration.zero);
    await _tickPlayer.resume();
  }

  Future<void> _dispose() async {
    await _ringPlayer.release();
    await _ringPlayer.dispose();

    await _tickPlayer.release();
    await _tickPlayer.dispose();
  }

  @override
  void dispose() {
    _dispose();
    _controller.dispose();
    super.dispose();
  }

  void _toggleStartStopBottom() async {
    setState(() {
      hasStarted = !hasStarted;
      if (active < 0 ||
          !hasStarted && _controller.status == AnimationStatus.completed) {
        active++;
      }
    });

    if (hasStarted) {
      _controller.forward();
      _tick();
    } else {
      _tickPlayer.stop();
      _controller.stop();
    }
  }

  void _togglePomodoroState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MainBody(
            numberOfPomodoros: pomodoroList.length,
            active: active,
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (abCtx, widget) {
              return ClockCap(
                barCount: 30,
                minutes: pomodoroList[active >= 0 ? active : 0],
                progression: _animation.value,
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SettingsPage.routeName);
              },
              child: const Icon(
                Icons.undo,
                color: Colors.white70,
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
              child: const Icon(
                Icons.settings,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleStartStopBottom,
        child: Icon(hasStarted ? Icons.pause : Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
