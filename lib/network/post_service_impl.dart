import 'dart:convert';

import 'package:get_injectable/common/constants.dart';
import 'package:get_injectable/models/post.dart';
import 'package:get_injectable/network/data/api_response.dart';
import 'package:get_injectable/network/post_service.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@Injectable(as: PostService)
class PostServiceImpl implements PostService {
  @override
  Future<APIResponse<Post>> getPostById(int id) async {
    try {
      final response = await http.get(Uri.parse('${Network.baseUrl}/posts/$id'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final post = Post.fromJson(jsonData);
        return APIResponse<Post>(
          data: post,
        );
      } else {
        return APIResponse<Post>(
          isError: true,
          errorMessage: "Something went wrong.",
        );
      }
    } catch (e) {
      return APIResponse<Post>(
        isError: true,
        errorMessage: "Connection issue, try again later",
      );
    }
  }

  @override
  Future<APIResponse<List<Post>>> getPosts() async {
    try {
      final response = await http.get(Uri.parse('${Network.baseUrl}/posts'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final posts = jsonData.map<Post>((post) => Post.fromJson(post)).toList() as List<Post>;
        return APIResponse<List<Post>>(
          data: posts,
        );
      } else {
        return APIResponse<List<Post>>(
          isError: true,
          errorMessage: "Something went wrong.",
        );
      }
    } catch (e) {
      return APIResponse<List<Post>>(
        isError: true,
        errorMessage: "Connection issue, try again later",
      );
    }
  }
}
