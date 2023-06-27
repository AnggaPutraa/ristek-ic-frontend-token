import 'package:ic_jwt/core/extensions/response.dart';
import 'package:ic_jwt/features/main/data/models/posts_model.dart';

import '../data_source/main_data_source.dart';

class MainRepository {
  final MainDatasource _repository = MainDatasource();
  Future<Parsed<PostsModel>> getPosts() async {
    return await _repository.getPosts();
  }
}
