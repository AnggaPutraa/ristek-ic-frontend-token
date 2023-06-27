import 'package:ic_jwt/core/client/dio.dart';
import 'package:ic_jwt/core/environments/endpoints.dart';
import 'package:ic_jwt/core/extensions/response.dart';
import 'package:ic_jwt/features/main/data/models/posts_model.dart';

class MainDatasource {
  Future<Parsed<PostsModel>> getPosts() async {
    const url = Endpoints.getPost;
    final resp = await getIt(url);
    final posts = PostsModel.fromJson(resp.bodyAsMap);
    return resp.parse(posts);
  }
}
