import 'package:get_injectable/models/post.dart';
import 'package:get_injectable/network/data/api_response.dart';

abstract class PostService {
  Future<APIResponse<List<Post>>> getPosts();

  Future<APIResponse<Post>> getPostById(int id);
}
