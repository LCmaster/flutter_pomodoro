import 'package:flutter/material.dart';

class MainBody extends StatelessWidget {
  final double iconSize = 48;

  const MainBody({
    Key? key,
  }) : super(key: key);

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
