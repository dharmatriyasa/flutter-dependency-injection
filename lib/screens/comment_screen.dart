import 'package:flutter/material.dart';
import 'package:get_injectable/di/di.dart';
import 'package:get_injectable/models/comment.dart';
import 'package:get_injectable/network/comment_service.dart';
import 'package:get_injectable/network/data/api_response.dart';
import 'package:get_injectable/widgets/comment_card.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  late APIResponse<List<Comment>> response;

  @override
  void initState() async {
    response = await getIt.get<CommentService>().getComments();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(!response.isError) {
      final comments = response.data!;
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return CommentCard(
            name: comments[index].name,
            body: comments[index].body,
          );
        },
        itemCount: comments.length,
      );
    } else if (response.isError) {
      return Text(response.errorMessage!);
    } else {
      return const CircularProgressIndicator();
    }
  }
}
