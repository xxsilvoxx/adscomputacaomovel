import 'package:flutter/material.dart';

class Carta {
  int id;
  int grupo;
  Color color;
  bool visivel;
  String image;

  Carta({this.id, this.grupo, this.color, this.visivel = false, this.image});
}
