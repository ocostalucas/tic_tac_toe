import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String pathIcons = 'assets/svg/';

class AppIcons {
  static const logoMini = '${pathIcons}logo-mini.svg';
  static const logoFull = '${pathIcons}logo-full.svg';
  static const googleLogo = '${pathIcons}google-logo.svg';
}

class AppIcon extends StatelessWidget {
  final String icon;
  final Size size;
  final Color? color;

  const AppIcon({
    Key? key,
    required this.icon,
    this.size = const Size(24, 24),
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      height: size.height,
      width: size.width,
      color: color,
    );
  }
}
