import 'package:flutter/cupertino.dart';
import 'package:project001/models/post_model.dart';
import 'package:project001/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);

  fetch() async {
    posts.value = await _homeRepository.getList() as List<PostModel>;
  }
}
