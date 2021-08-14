import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/modules/game/game_screen.dart';
import 'package:tic_tac_toe/app/shared/core/app_theme.dart';

import 'modules/auth/login/login_screen.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo da velha',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => LoginScreen(),
        "/game": (context) => GameScreen(),
      },
    );
  }
}
