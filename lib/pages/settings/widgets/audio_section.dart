import 'package:flutter/material.dart';

class AudioSection extends StatelessWidget {
  final double ringingVolume;
  final double tickingVolume;
  final Function(double) ringingVolumeCallback;
  final Function(double) tickingVolumeCallback;

  const AudioSection({
    Key? key,
    required this.ringingVolume,
    required this.tickingVolume,
    required this.ringingVolumeCallback,
    required this.tickingVolumeCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: Text(
              'Ticking Volume',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Slider(value: tickingVolume, onChanged: tickingVolumeCallback),
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
          Slider(value: ringingVolume, onChanged: ringingVolumeCallback),
        ],
      ),
    ]);
  }
}
