import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/constants.dart';

class TimerSection extends StatelessWidget {
  const TimerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Pomodoro Duration',
                style: Theme.of(context).textTheme.headline6,
              ),
              DropdownButton(
                isExpanded: true,
                items: kPomodoroDurationList
                    .map(
                      (e) => DropdownMenuItem<int>(
                        value: e,
                        child: Text('$e minutes'),
                      ),
                    )
                    .toList(),
                onChanged: (value) {},
                value: kPomodoroDurationList[kInitialIndex],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Short Break Duration',
                style: Theme.of(context).textTheme.headline6,
              ),
              DropdownButton(
                isExpanded: true,
                items: kShortBreakDurationList
                    .map(
                      (e) => DropdownMenuItem<int>(
                        value: e,
                        child: Text('$e minutes'),
                      ),
                    )
                    .toList(),
                onChanged: (value) {},
                value: kShortBreakDurationList[kInitialIndex],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Long Break Duration',
                style: Theme.of(context).textTheme.headline6,
              ),
              DropdownButton(
                isExpanded: true,
                items: kLongBreakDurationList
                    .map(
                      (e) => DropdownMenuItem<int>(
                        value: e,
                        child: Text('$e minutes'),
                      ),
                    )
                    .toList(),
                onChanged: (value) {},
                value: kLongBreakDurationList[kInitialIndex],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
