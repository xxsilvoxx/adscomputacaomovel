import 'dart:async';

class UsuarioDao {
  Future<String> retornaStringDepoisDeDezSegundos() async {
    // retorna depois que o processamento acabar
  }

  void executaTimer() async {
    //Código aguarda retorno par acontinuar
    var msg = await retornaStringDepoisDeDezSegundos();
    print(msg);
    //Código não aguarda retorno para continhar
    retornaStringDepoisDeDezSegundos().then((msg) {
      print(msg);
    });
    print(msg);
  }
}
