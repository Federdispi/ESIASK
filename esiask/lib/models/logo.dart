import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    required this.fontSize,
  }) : super(key: key);

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      "ESIASK",
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(0, 5 * fontSize / 48),
            blurRadius: 10.0 * fontSize / 48,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          Shadow(
            offset: Offset(0, 5 * fontSize / 48),
            blurRadius: 18.0 * fontSize / 48,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
