import 'package:flutter/material.dart';

class ClockCap extends StatelessWidget {
  final int barCount;
  final int minutes;
  final double progression;
  final double barWidth = 25;

  const ClockCap({
    Key? key,
    required this.barCount,
    required this.minutes,
    required this.progression,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight / 5,
          decoration: BoxDecoration(
              color: Colors.redAccent,
              gradient: LinearGradient(
                colors: [
                  // HSVColor.fromColor(Color(0xFFCB2611)).withValue(0.5).toColor(),
                  // HSVColor.fromColor(Color(0xFFCB2611)).withSaturation(0.7).toColor(),
                  // HSVColor.fromColor(Color(0xFFCB2611)).withValue(0.5).toColor(),
                  HSVColor.fromColor(Colors.red).withValue(0.45).toColor(),
                  HSVColor.fromColor(Colors.red).withSaturation(0.85).toColor(),
                  HSVColor.fromColor(Colors.red).withValue(0.45).toColor(),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 5,
                  blurRadius: 7,
                )
              ]),
          child: FittedBox(
            alignment: Alignment.bottomLeft,
            fit: BoxFit.none,
            child: ClipRect(
              clipBehavior: Clip.hardEdge,
              child: Transform(
                alignment: Alignment.topLeft,
                transform: Matrix4.identity()
                  ..translate(constraints.maxWidth / 2 -
                      barWidth * progression +
                      barWidth / 2),
                child: Container(
                  constraints: BoxConstraints(
                    minWidth: constraints.maxWidth
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for (int i = 0; i <= barCount; i++)
                        SizedBox(
                          width: barWidth,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (i % 5 == 0)
                                Text(
                                  i.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  softWrap: false,
                                ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: (i % 5 == 0) ? 25 : 15,
                                width: 2,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
