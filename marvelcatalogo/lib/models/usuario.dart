class Usuario {
  int id;
  String username;
  String publicKey;
  String privateKey;

  Usuario({this.id, this.username, this.publicKey, this.privateKey});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    publicKey = json['publicKey'];
    privateKey = json['privateKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['publicKey'] = this.publicKey;
    data['privateKey'] = this.privateKey;
    return data;
  }
}
