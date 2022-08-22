import 'package:dio/dio.dart';
import '../models/post_model.dart';
import 'home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts/');
      print(response);
    } catch (e) {
      print(e);
    }
    return [];
  }
}
