import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/widgets/game_board.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: Icon(Icons.memory),
        title: Text('Jogo da memória'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: GameBoard(),
      ),
    );
  }
}
