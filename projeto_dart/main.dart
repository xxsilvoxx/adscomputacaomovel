import 'models/itens.dart';
import 'models/produto.dart';
import 'models/usuario.dart';
import 'models/venda.dart';

main() {
  List<Item> criaProdutos() {
    return [
      Item(
        id: 1,
        quantidade: 3,
        produto:
            Produto(id: 1, nome: 'Tênis', desconto: 10, valor_unitario: 160.99),
      ),
      Item(
        id: 1,
        quantidade: 1,
        produto: Produto(
          id: 2,
          nome: 'Garrafa de cerveja',
          desconto: 0,
          valor_unitario: 10.0,
        ),
      ),
    ];
  }

  Venda venda = Venda(
    id: 1,
    items: criaProdutos(),
    usuario: Usuario(cpf: 'qweqwe', nome: 'Lucas H. de Abreu', id: 1),
    dataVenda: DateTime.now(),
  );

  print(venda);
}
