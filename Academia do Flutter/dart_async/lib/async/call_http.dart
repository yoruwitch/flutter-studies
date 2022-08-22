import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  // buscarCEP();
  // buscarPosts();
  salvarPost();
}

// Envia novos dados para a API:::
Future<void> salvarPost() async {
  var url = 'https://jsonplaceholder.typicode.com/posts';
  var mapaRequest = {
    'title': 'Postou um treco',
    'boody': 'Que treco maneiro',
    'userId': 4
  };

  var response =
      await http.post(Uri.parse(url), body: convert.jsonEncode(mapaRequest));
  print(response.statusCode);
  print(response.body);
}

// Quando o JSON retornado é em lista:::

Future<void> buscarPosts() async {
  var url = 'https://jsonplaceholder.typicode.com/posts';
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var responseData = convert.jsonDecode(response.body);
    if (responseData is List) {
      responseData.forEach((element) => print(element['id']));
    }
  }
}
// Quando o JSON retornado é em forma de elemento:::

Future<void> buscarCEP() async {
  var url = 'https://viacep.com.br/ws/28380000/json/';
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var responseData = convert.jsonDecode(response.body);
    print(responseData['cep']);
    print(responseData['logradouro']);
    print(responseData['localidade']);
    print(responseData['uf']);
    print(responseData['ddd']);
  }
}
