import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/models/carta.dart';

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<Carta> cartas = [];
  var caratasAgrupadas;
  bool mostrandoErro = false;

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
      Carta(id: 3, grupo: 2, color: Colors.amber),
      Carta(id: 4, grupo: 2, color: Colors.amber),
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
    this.cartas.shuffle();
  }

  List<Widget> _criaItensGrid() {
    return this.cartas.map((carta) => _criaCardCarta(carta)).toList();
  }

  Widget _criaCardCarta(Carta carta) {
    return GestureDetector(
      onTap:
          !carta.visivel && !mostrandoErro ? () => _mostrarCarta(carta) : null,
      child: Card(
        color: carta.visivel ? carta.color : Colors.grey,
        child: Center(
          child: _criaTextoCard(carta),
        ),
      ),
    );
  }

  Widget _criaTextoCard(Carta carta) {
    if (carta.visivel) {
      return Text(
        carta.grupo.toString(),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      );
    } else {
      return Icon(
        Icons.memory,
        color: Colors.white,
      );
    }
  }

  void _mostrarCarta(Carta carta) {
    setState(() {
      carta.visivel = !carta.visivel;
    });
    _validaAcerto();
  }

  void _validaAcerto() {
    List<Carta> listaCartasVisiveis = _getCartasVisiveis();
    if (listaCartasVisiveis.length >= 2) {
      caratasAgrupadas = _getCartasAgrupadas(listaCartasVisiveis);
      List<Carta> cartasIcorretas = List<Carta>();
      caratasAgrupadas.forEach((key, value) {
        if (value.length < 2) {
          cartasIcorretas.add(value[0]);
        }
      });

      if (cartasIcorretas.length >= 2) {
        _escondeCartasIcorretas(cartasIcorretas);
      }
    }
  }

  List<Carta> _getCartasVisiveis() {
    return this.cartas.where((Carta carta) => carta.visivel).toList();
  }

  Map<int, List<Carta>> _getCartasAgrupadas(List<Carta> cartas) {
    return groupBy(cartas, (Carta carta) => carta.grupo);
  }

  void _escondeCartasIcorretas(List<Carta> cartasIcorretas) {
    setState(() {
      mostrandoErro = true;
    });
    Timer(Duration(seconds: 1), () {
      for (var i = 0; i < cartasIcorretas.length; i++) {
        setState(() {
          cartasIcorretas[i].visivel = false;
        });
      }
      setState(() {
        mostrandoErro = false;
      });
    });
  }
}
