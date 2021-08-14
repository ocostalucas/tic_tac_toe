import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/shared/core/app_colors.dart';
import 'package:tic_tac_toe/app/shared/core/app_typography.dart';

class PlayerWidget extends StatelessWidget {
  PlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      padding: EdgeInsets.symmetric(vertical: 5),  
      decoration: BoxDecoration(color: AppColors.darkBlue,
      borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text('Lucas', style: AppTypography.body),
          ),
          Text('X', style: AppTypography.heading)
        ],
      ),
    );
  }
}
