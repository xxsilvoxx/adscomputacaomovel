import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/models/carta.dart';

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<Carta> cartas = [];

  @override
  void initState() {
    _criaListaCartas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _criaGridCartas();
  }

  Widget _criaGridCartas() {
    return GridView.count(
      crossAxisCount: 4,
      children: _criaItensGrid(),
    );
  }

  void _criaListaCartas() {
    this.cartas = [
      Carta(id: 1, grupo: 1, color: Colors.red),
      Carta(id: 2, grupo: 1, color: Colors.red),
      Carta(id: 3, grupo: 2, color: Colors.yellow),
      Carta(id: 4, grupo: 2, color: Colors.yellow),
      Carta(id: 5, grupo: 3, color: Colors.blue),
      Carta(id: 6, grupo: 3, color: Colors.blue),
      Carta(id: 7, grupo: 4, color: Colors.green),
      Carta(id: 8, grupo: 4, color: Colors.green),
      Carta(id: 9, grupo: 5, color: Colors.purple),
      Carta(id: 10, grupo: 5, color: Colors.purple),
      Carta(id: 11, grupo: 6, color: Colors.pink),
      Carta(id: 12, grupo: 6, color: Colors.pink),
      Carta(id: 13, grupo: 7, color: Colors.brown),
      Carta(id: 14, grupo: 7, color: Colors.brown),
      Carta(id: 15, grupo: 8, color: Colors.orange),
      Carta(id: 16, grupo: 8, color: Colors.orange),
    ];
  }

  List<Widget> _criaItensGrid() {
    return this.cartas.map((carta) => _criaCardCarta(carta)).toList();
  }

  Card _criaCardCarta(Carta carta) {
    return Card(
      color: carta.color,
      child: Text(
        carta.grupo.toString(),
      ),
    );
  }
}
