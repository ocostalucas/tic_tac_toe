import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/shared/core/app_colors.dart';

class RoundButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget icon;
  final Color color;
  final Size size;

  const RoundButtonWidget({
    Key? key,
    this.onTap,
    required this.icon,
    this.color = AppColors.darkBlue,
    this.size = const Size(45, 45),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: ClipOval(
        child: Material(
          color: color,
          child: InkWell(
            onTap: onTap != null ? onTap : () {},
            child: Center(
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
