import 'package:flutter/material.dart';

class BoardScreen extends StatelessWidget {
  BoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabuleiro'),
      ),
      body: Column(
        children: [
          GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (BuildContext context, int index) => Container(),
          )
        ],
      ),
    );
  }
}
