import 'package:flutter/material.dart';
import 'package:get_injectable/di/di.dart';
import 'package:get_injectable/network/data/api_response.dart';
import 'package:get_injectable/models/post.dart';
import 'package:get_injectable/network/post_service.dart';
import 'package:get_injectable/widgets/post_card.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  APIResponse<List<Post>>? response;

  @override
  void initState() {
    _getPosts();
    super.initState();
  }

  void _getPosts() async {
    final result = await getIt.get<PostService>().getPosts();
    setState(() {
      response = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (response != null) {
      if (!response!.isError) {
        final posts = response!.data!;
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return PostCard(
              title: posts[index].title,
              body: posts[index].body,
              name: posts[index].title,
              email: posts[index].title,
            );
          },
        );
      } else {
        return Text(response!.errorMessage!);
      }
    } else {
      return const CircularProgressIndicator();
    }
  }
}
