import 'dart:convert';

import 'package:get_injectable/common/constants.dart';
import 'package:get_injectable/models/comment.dart';
import 'package:get_injectable/network/comment_service.dart';
import 'package:get_injectable/network/data/api_response.dart';
import 'package:http/http.dart' as http;

class CommentServiceImpl implements CommentService {
  @override
  Future<APIResponse<Comment>> getCommentById(int id) async {
    try {
      final response = await http.get(Uri.parse('${Network.baseUrl}/comment/$id'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final comment = Comment.fromJson(jsonData);
        return APIResponse<Comment>(
          data: comment,
        );
      } else {
        return APIResponse<Comment>(
          isError: true,
          errorMessage: "Something went wrong.",
        );
      }
    } catch (e) {
      return APIResponse<Comment>(
        isError: true,
        errorMessage: "Connection issue, try again later.",
      );
    }
  }

  @override
  Future<APIResponse<List<Comment>>> getComments() async {
    try {
      final response = await http.get(Uri.parse('${Network.baseUrl}/comments'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<Comment> comments = jsonData.map((comment) => Comment.fromJson(comment)).toList();
        return APIResponse<List<Comment>>(
          data: comments,
        );
      } else {
        return APIResponse<List<Comment>>(
          isError: true,
          errorMessage: "Something went wrong.",
        );
      }
    } catch (e) {
      return APIResponse<List<Comment>>(
        isError: true,
        errorMessage: "Connection issue, try again later.",
      );
    }
  }

  @override
  Future<APIResponse<List<Comment>>> getCommentsByPostId(int id) async {
    try {
      final response = await http.get(Uri.parse('${Network.baseUrl}/comments?postId=$id'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<Comment> postComments = jsonData.map((postComment) => Comment.fromJson(postComment)).toList();
        return APIResponse<List<Comment>>(
          data: postComments,
        );
      } else {
        return APIResponse<List<Comment>>(
          isError: true,
          errorMessage: "Something went wrong.",
        );
      }
    } catch (e) {
      return APIResponse<List<Comment>>(
        isError: true,
        errorMessage: "Connection issue, try again later.",
      );
    }
  }
}
