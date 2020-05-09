

class Endereco{

  final cep;
  final logradouro;
  final complemento;
  final bairro;
  final localidade;
  final uf;

  Endereco({this.cep = '', this.logradouro = '', this.complemento = '', this.bairro = '',
      this.localidade = '', this.uf = ''});

  factory Endereco.fromJson(Map<String, dynamic> json){
    return Endereco(
      cep: json['cep'],
      logradouro: json['logradouro'],
      complemento: json['complemento'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      uf: json['uf']
    );
  }
}