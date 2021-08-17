import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/shared/components/buttons/button_widget.dart';
import 'package:tic_tac_toe/app/shared/core/app_colors.dart';
import 'package:tic_tac_toe/app/shared/core/app_images.dart';
import 'package:tic_tac_toe/app/shared/core/app_typography.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Jogo da Velha', style: AppTypography.heading),
            Container(
              height: 4,
              width: 150,
              color: AppColors.white,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Image.asset(
                AppImages.boardLogo,
                width: MediaQuery.of(context).size.width * .55,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ButtonWidget(
                label: 'Jogar',
                onTap: () async =>
                    await Navigator.pushReplacementNamed(context, "/game"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
