enum PomodoroType {
  concentrate,
  rest,
}

class Pomodoro {
  final PomodoroType type;
  final int minutes;

  Pomodoro({required this.type, required this.minutes});

  Pomodoro.rest({required this.minutes}) : type = PomodoroType.rest;
  Pomodoro.concentrate({required this.minutes}) : type = PomodoroType.concentrate;
}