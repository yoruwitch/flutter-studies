import 'dart:convert';

class Cidade {
  final String cep;
  final String logradouro;
  final String localidade;
  final String uf;
  final String ddd;
  Cidade({
    required this.cep,
    required this.logradouro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });
// gera uma cidade usando Map:::

  factory Cidade.fromMap(Map<String, dynamic> map) {
    //dynamic aceita null by default
    return Cidade(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      localidade: map['localidade'] ?? '',
      uf: map['uf'] ?? '',
      ddd: map['ddd'] ?? '',
    );
  }

  // factory Cidade.fromJson(String source) { // o JSON é uma String
  //   var jsonMap = jsonDecode(source); //virou Map
  //   return Cidade.fromMap(jsonMap); // método que mapeia Maps
  // }
  // factory abaixo faz o mesmo que esta acima:::
  factory Cidade.fromJson(String source) => Cidade.fromMap(jsonDecode(source));

  // representam a instância da API:::

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'localidade': localidade,
      'uf': uf,
      'ddd': ddd,
    };
  }

  String toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return 'Cidade(cep: $cep, logradouro: $logradouro, localidade: $localidade, uf: $uf, ddd: $ddd)';
  }
}
