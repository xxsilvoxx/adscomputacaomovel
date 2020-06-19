import 'itens.dart';
import 'usuario.dart';

class Venda {
  int id;
  List<Item> items;
  DateTime dataVenda;
  Usuario usuario;

  Venda({this.id, this.items, this.dataVenda, this.usuario});
}
