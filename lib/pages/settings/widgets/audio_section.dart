import 'package:flutter/material.dart';

class AudioSection extends StatelessWidget {
  const AudioSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: Text(
              'Enable Ticking',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Checkbox(value: true, onChanged: (value) {}),
        ],
      ),
      Row(
        children: [
          Expanded(
            child: Text(
              'Ticking Volume',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Slider(value: 1.0, onChanged: (double value) {}),
        ],
      ),
      Row(
        children: [
          Expanded(
            child: Text(
              'Ringing Volume',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Slider(value: 1.0, onChanged: (double value) {}),
        ],
      ),
    ]);
  }
}
