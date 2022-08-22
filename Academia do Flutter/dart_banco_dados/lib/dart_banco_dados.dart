import 'package:dart_banco_dados/databse.dart';

Future<void> main() async {
  final database = Database();
  var msqlConnection = await database.openConnection();

  var result = await msqlConnection.query(
    'insert into aluno(id, nome) values(?,?)',
    [
      null,
      'Evelyn Fernandes',
    ],
  );

  print(result.affectedRows);
}
