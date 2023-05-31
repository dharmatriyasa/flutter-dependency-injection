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
  APIResponse<List<Comment>>? response;

  @override
  void initState() {
    _getComments();
    super.initState();
  }

  void _getComments() async {
    final result = await getIt.get<CommentService>().getComments();
    setState(() {
      response = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (response != null) {
      if(!response!.isError && response!.data !=null) {
        final comments = response!.data!;
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return CommentCard(
              name: comments[index].name,
              body: comments[index].body,
            );
          },
          itemCount: comments.length,
        );
      } else {
        return Text(response!.errorMessage!);
      }
    } else {
      return const CircularProgressIndicator();
    }
  }
}
