import 'dart:convert';

//ctrl+. JSON generate
class CidadeEasy {
  final String cep;
  final String logradouro;
  final String localidade;
  final String uf;
  final String ddd;
  CidadeEasy({
    required this.cep,
    required this.logradouro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'localidade': localidade,
      'uf': uf,
      'ddd': ddd,
    };
  }

  factory CidadeEasy.fromMap(Map<String, dynamic> map) {
    return CidadeEasy(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      localidade: map['localidade'] ?? '',
      uf: map['uf'] ?? '',
      ddd: map['ddd'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CidadeEasy.fromJson(String source) =>
      CidadeEasy.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CidadeEasy(cep: $cep, logradouro: $logradouro, localidade: $localidade, uf: $uf, ddd: $ddd)';
  }
}
