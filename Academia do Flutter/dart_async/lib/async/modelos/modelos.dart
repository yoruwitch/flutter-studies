import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'cidade.dart';
import 'cidade_easy.dart';

void main() {
  buscarCEP();
}

Future<void> buscarCEP() async {
  var url = 'https://viacep.com.br/ws/28380000/json/';
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // var responseData = convert.jsonDecode(response.body);
    // print(responseData['cep']);
    // print(responseData['logradouro']);
    // print(responseData['localidade']);
    // print(responseData['uf']);
    // print(responseData['ddd']);

    var cidade = CidadeEasy.fromJson(response.body);
    print(cidade);
  }
}
