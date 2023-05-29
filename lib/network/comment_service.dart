import 'package:get_injectable/models/comment.dart';
import 'package:get_injectable/network/data/api_response.dart';

abstract class CommentService {
  Future<APIResponse<List<Comment>>> getComments();

  Future<APIResponse<Comment>> getCommentById(int id);

  Future<APIResponse<List<Comment>>> getCommentsByPostId(int id);
}
