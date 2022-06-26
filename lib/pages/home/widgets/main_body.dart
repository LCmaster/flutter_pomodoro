import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainBody extends StatelessWidget {
  final double iconSize = 48;
  final int numberOfPomodoros;
  final int active;

  const MainBody({
    Key? key,
    required this.numberOfPomodoros,
    required this.active,
  }) : super(key: key);

  String _bulletType(int index) {
    if (index < active) {
      return 'assets/image/bullet_done.svg';
    }
    if (index == active) {
      return 'assets/image/bullet_on.svg';
    }

    return 'assets/image/bullet.svg';
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            gradient: LinearGradient(
              colors: [
                // Color(0xFFCB2611),
                // Colors.red,
                // Color(0xFFCB2611),
                HSVColor.fromColor(Colors.red).withValue(0.45).toColor(),
                HSVColor.fromColor(Colors.red).withSaturation(0.85).toColor(),
                HSVColor.fromColor(Colors.red).withValue(0.45).toColor(),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < numberOfPomodoros; i++)
                      Container(
                        width: 40.0,
                        height: 40.0,
                        margin: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          _bulletType(i),
                        ),
                      ),
                  ],
                ),
              ),
              Positioned(
                top: constraints.maxHeight / 5,
                left: constraints.maxWidth / 2 - iconSize / 2,
                child: Icon(
                  Icons.arrow_drop_up,
                  size: iconSize,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
