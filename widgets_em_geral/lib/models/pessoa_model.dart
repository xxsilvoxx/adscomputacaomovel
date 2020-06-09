class Pessoa {
  String primeiroNome;
  String ultimoNome;
  String fotoPerfil;
  String endereco;
  String filmeFavorito;
  String carro;
  String corFavorita;

  Pessoa(
      {this.primeiroNome,
      this.ultimoNome,
      this.fotoPerfil,
      this.endereco,
      this.filmeFavorito,
      this.carro,
      this.corFavorita});

  Pessoa.fromJson(Map<String, dynamic> json) {
    primeiroNome = json['primeiro_nome'];
    ultimoNome = json['ultimo_nome'];
    fotoPerfil = json['foto_perfil'];
    endereco = json['endereco'];
    filmeFavorito = json['filme_favorito'];
    carro = json['carro'];
    corFavorita = json['cor_favorita'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primeiro_nome'] = this.primeiroNome;
    data['ultimo_nome'] = this.ultimoNome;
    data['foto_perfil'] = this.fotoPerfil;
    data['endereco'] = this.endereco;
    data['filme_favorito'] = this.filmeFavorito;
    data['carro'] = this.carro;
    data['cor_favorita'] = this.corFavorita;
    return data;
  }
}
