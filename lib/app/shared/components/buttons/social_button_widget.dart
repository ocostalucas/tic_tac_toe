import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/shared/core/app_colors.dart';
import 'package:tic_tac_toe/app/shared/core/app_icons.dart';
import 'package:tic_tac_toe/app/shared/core/app_typography.dart';

class SocialButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const SocialButtonWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        splashColor: AppColors.border.withOpacity(.1),
        child: Container(
          height: 56,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border:
                  Border.fromBorderSide(BorderSide(color: AppColors.border))),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppIcon(icon: AppIcons.googleLogo),
                    ),
                    Container(height: 56, width: 1, color: AppColors.border)
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Entrar com Google',
                      style: AppTypography.body,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
