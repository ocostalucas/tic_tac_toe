import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

const String pathLottie = 'assets/lottie/';

class AppLottieFiles {
  static const arrowDown = '${pathLottie}arrow-down.json';
}

class AppLottie extends StatelessWidget {
  final String lottie;
  final Size size;
  final bool repeat;

  const AppLottie({
    Key? key,
    required this.lottie,
    this.size = const Size(24, 24),
    this.repeat = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      lottie,
      height: size.height,
      width: size.width,
      repeat: repeat,
    );
  }
}
